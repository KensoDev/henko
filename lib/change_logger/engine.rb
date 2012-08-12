module ChangeLogger
  class Engine < ::Rails::Engine
    isolate_namespace ChangeLogger

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
      g.orm :mongoid
      g.fixture_replacement :fabrication
    end
  end
end
