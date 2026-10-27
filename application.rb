require_relative "boot"
require "rails"
require "sprockets/railtie"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"
require "active_storage/engine"
require "action_cable/engine"
require "rails/test_unit/railtie"
Bundler.require(*Rails.groups)
module ClubSelectionApp
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w[assets tasks]) if config.respond_to?(:autoload_lib)
    config.time_zone = "Kolkata"
  end
end
