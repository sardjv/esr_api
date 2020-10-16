class ApplicationJob < ActiveJob::Base
  queue_as :asynchronous
end
