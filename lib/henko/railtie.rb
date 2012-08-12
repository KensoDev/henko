module Henko
  class Railtie < Rails::Railtie
    initializer 'henko.initialize' do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, Henko::ActiveRecordExtensions
      end
    end
  end
end
