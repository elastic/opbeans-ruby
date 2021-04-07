require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Opbeans
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.elastic_apm.server_url =
      ENV.fetch('ELASTIC_APM_SERVER_URL', 'http://localhost:8200')
    config.elastic_apm.log_level = Logger::DEBUG
    config.elastic_apm.pool_size = 2

    middleware.use Rack::Static,
      urls: [%r{/images}, %r{/static}],
      root: Rails.root.join('frontend', 'build').to_s

    middleware.insert 0, OpbeansShuffle,
      %r{/api},
      services: ENV.fetch('OPBEANS_SERVICES', ''),
      probability: ENV.fetch('OPBEANS_DT_PROBABILITY', 0.5)
  end
end
