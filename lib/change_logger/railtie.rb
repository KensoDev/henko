module ChangeLogger
  class Railtie < Rails::Railtie
    initializer 'change_logger.initialize' do
      ActiveSupport.on_load(:active_record) do
        puts "Something is included now"
        ActiveRecord::Base.send :include, ChangeLogger::ActiveRecordExtensions
        puts "something was already included"
      end
    end
  end
end
