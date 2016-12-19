module Libalyzer
  class ApplicationController < Sinatra::Base
    set :root,  ENV['SINATRA_ROOT']
    set :views, Proc.new { File.join(root, 'app', 'views') }

    get '/' do
      slim :'reports/new', layout: :'layouts/application'
    end

  end
end
