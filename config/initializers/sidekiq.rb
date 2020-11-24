sidekiq_config = { url: "redis://:#{ENV['REDIS_PASSWORD']}@redis:#{ENV['REDIS_PORT']}/0" }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end
