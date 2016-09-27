threads Integer(ENV['MIN_THREADS']  || 0), Integer(ENV['MAX_THREADS'] || 10)

preload_app!
rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    config['pool'] = ENV['DB_POOL'] || 5
    ActiveRecord::Base.establish_connection(config)
  end
end