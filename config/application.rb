require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module Devmail
  class Application < Rails::Application
    config.github = Hash.new
    config.assets.quiet = true
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.active_job.queue_adapter = :resque
  end
end
