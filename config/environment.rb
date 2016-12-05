require_relative 'boot'

require 'sinatra'

ENV['SINATRA_ROOT'] = File.expand_path('../..', __FILE__)

Bundler.require(:default, Sinatra::Application.environment)

Dir.glob(ENV['SINATRA_ROOT'] + '/config/initializers/*.rb').each { |file| require file }
Dir.glob(ENV['SINATRA_ROOT'] + '/app/**/*.rb').each { |file| require file }
