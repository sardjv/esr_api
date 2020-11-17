class ApplicationJob < ActiveJob::Base
  queue_as :asynchronous
  sidekiq_options retry: false # Failed jobs usually need debugging, not retrying.
end
