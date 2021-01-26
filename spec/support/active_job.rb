module ActiveJob
  # Suppress noisy logs.
  # Use like this:
  # ActiveJob.quiet { ImportFileJob.perform_now(filename: filename) }
  def self.quiet
    logger = ActiveJob::Base.logger
    ActiveJob::Base.logger = Logger.new(IO::NULL)

    yield

    # Back to normal.
    ActiveJob::Base.logger = logger
  end
end
