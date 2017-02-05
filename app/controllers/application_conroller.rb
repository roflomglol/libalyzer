module Libalyzer
  class ApplicationController < Sinatra::Base
    register Sinatra::Sprockets::Helpers

    set :root,           ENV['SINATRA_ROOT']
    set :views,          File.join(root, 'app', 'views')
    set :sprockets,      Sprockets::Environment.new(root)
    set :digest_assets,  true
    set :assets_prefix,  '/assets'

    configure do
      sprockets.append_path File.join(root, 'app', 'assets', 'stylesheets')
      sprockets.append_path File.join(root, 'app', 'assets', 'javascripts')
      sprockets.append_path File.join(root, 'app', 'assets', 'images')

      configure_sprockets_helpers do |helpers|
        helpers.environment = settings.sprockets
      end
    end

    get '/assets/*' do
      env['PATH_INFO'].sub!('/assets', '')
      settings.sprockets.call(env)
    end

    get '/' do
      slim :'reports/new', layout: :'layouts/application'
    end

    get '/reports/:id' do
      @report = Report.find(params[:id])
      @report_as_data_attribute = @report.body.map { |k, v| { axis: k, value: v } }.to_json

      slim :'reports/show', layout: :'layouts/application'
    end

    post '/reports' do
      @report = Reports::Create.call(params.fetch('report'))

      redirect("/reports/#{@report.id}")
    end
  end
end
