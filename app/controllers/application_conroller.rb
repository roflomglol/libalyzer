module Libalyzer
  class ApplicationController < Sinatra::Base
    set :root,  ENV['SINATRA_ROOT']
    set :views, Proc.new { File.join(root, 'app', 'views') }

    get '/' do
      slim :'reports/new', layout: :'layouts/application'
    end

    get '/reports/:id' do
      @report = Report.find(params[:id])

      slim :'reports/show', layout: :'layouts/application'
    end

    post '/reports' do
      @report = Reports::Create.call(params.fetch('report'))

      redirect("/reports/#{@report.id}")
    end
  end
end
