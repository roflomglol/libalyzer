ActiveRecord::Base.configurations = YAML.load_file(ENV['SINATRA_ROOT'] + '/config/database.yml')
ActiveRecord::Base.establish_connection(Sinatra::Application.environment)
