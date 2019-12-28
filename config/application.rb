require_relative 'boot'
require_relative '../lib/opbeans_shuffle'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Opbeans
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # config.elastic_apm.server_url =
    #   ENV.fetch('ELASTIC_APM_SERVER_URL', 'http://localhost:8200')
    config.elastic_apm.log_level = Logger::DEBUG
    # config.elastic_apm.pool_size = 8
    # config.elastic_apm.api_buffer_size = 1024
    config.elastic_apm.service_name = 'my-service'

    # Use if APM Server requires a token
    config.elastic_apm.secret_token = '2zwedSuD9B0atKAouV'
    
    # Set custom APM Server URL (default: http://localhost:8200)
    config.elastic_apm.server_url = 'https://8ad00e0711d149fbb56254c9f7851008.apm.us-west1.gcp.cloud.es.io:443'
    config.elastic_apm.log_path = Rails.root.join('log', 'elastic.log')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    middleware.use Rack::Static,
      urls: [%r{/images}, %r{/static}],
      root: Rails.root.join('frontend', 'build').to_s

    # middleware.insert 0, OpbeansShuffle,
    #   %r{/api},
    #   services: ENV.fetch('OPBEANS_SERVICES', ''),
    #   probability: ENV.fetch('OPBEANS_DT_PROBABILITY', 0.5)
  end
end
