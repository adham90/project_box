require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'mongoid'

Mongoid.load!(File.expand_path('mongoid.yml', './config'))
Bundler.require(*Rails.groups)

module Lock
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.api_only = true

    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
