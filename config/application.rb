require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EsrApi # rubocop:disable Style/ClassAndModuleChildren
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set up logging to be the same in all environments but control the level
    # through an environment variable.
    config.log_level = ENV['LOG_LEVEL'] if ENV['LOG_LEVEL']


    # Log to STDOUT because Docker expects all processes to log here. You could
    # then redirect logs to a third party service on your own such as systemd,
    # or a third party host such as Loggly, etc..
    logger           = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.log_tags  = %i[subdomain uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(logger)

    # We don't necessarily have the ability to send emails within an organisation,
    # so disable them here.
    config.action_mailer.perform_deliveries = false

    # Set Redis as the back-end for the cache.
    config.cache_store = :redis_cache_store, {
      url: "redis://:#{ENV['REDIS_PASSWORD']}@redis:#{ENV['REDIS_PORT']}/0",
      namespace: ENV['REDIS_CACHE_NAMESPACE']
    }

    config.active_record.belongs_to_required_by_default = false

    # Set Sidekiq as the back-end for Active Job.
    config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_name_prefix =
      "#{ENV['ACTIVE_JOB_QUEUE_PREFIX']}_#{Rails.env}"
  end
end
