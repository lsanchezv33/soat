# frozen_string_literal: true

require_relative 'boot'
require 'rails'

# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Soat
  # Application Config
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.generators do |g|
      g.system_tests        false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.stylesheets         false
      g.javascripts         false
      g.helper              false
      g.jbuilder            false
      g.test_framework      :rspec,
                            fixtures: true,
                            view_specs: false,
                            helper_specs: false,
                            routing_specs: false,
                            controller_specs: true,
                            request_specs: true
    end

    # Don't generate system test files.
    # It's the same that the line 29
    # config.generators.system_tests = nil

    # use to not procompile assets
    config.assets.initialize_on_precompile = false
  end
end
