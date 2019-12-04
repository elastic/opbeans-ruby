require_relative 'boot'
require_relative '../lib/opbeans_shuffle'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Opbeans
  class Application < Rails::Application
    config.elastic_apm.server_url =
      ENV.fetch('ELASTIC_APM_SERVER_URL', 'http://localhost:8200')
    config.elastic_apm.log_level = Logger::DEBUG
    config.elastic_apm.pool_size = 2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    middleware.use Rack::Static,
      urls: [%r{/images}, %r{/static}],
      root: Rails.root.join('frontend', 'build').to_s

    middleware.insert 0, OpbeansShuffle,
      %r{/api},
      services: ENV.fetch('OPBEANS_SERVICES', ''),
      probability: ENV.fetch('OPBEANS_DT_PROBABILITY', 0.5)
  end
end
