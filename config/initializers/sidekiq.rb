sidekiq_config = { url: "redis://:#{ENV['REDIS_PASSWORD']}@redis:#{ENV['REDIS_PORT']}/0" }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end

if ENV['CRONJOBS_ACTIVE'] == 'true' && !Rails.env.test?
  # Cronjob to import data every day.
  # Unique on name parameter; recreating will overwrite any existing job with the same name.
  Sidekiq::Cron::Job.create(
    name: 'ImportFromFtpJob',
    cron: '0 8 * * *', # Import every day at 08:00 AM. Anecdotally the FTP server appears to update at about 5:30AM.
    class: 'ImportFromFtpJob',
    queue: :asynchronous
  )
end
