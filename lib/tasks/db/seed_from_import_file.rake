namespace :db do
  desc "seed from import file"
  # TODO make sure it only runs in development
  task :seed_from_import_file, [:file_path] => :environment do |task, args|
    puts "Seeding from the importation file"
    puts "Checking a file exists at that path..."
    puts "File exists? #{File.exists?(args.file_path)}"
    raise "Can not find a file at #{args.file_path}" unless File.exists?(args.file_path)

    # Set logger level to 1 (:info) instead of default 0 (:debug)
    ActiveRecord::Base.logger.level = 1
    PaperTrail.enabled = false
    PublicActivity.enabled = false

    # These don't do anything because the job is actually run in sidekiq workers that still have this enabled^^^

    puts 'Checking you\'re not running in production...'
    puts "Rails env: #{Rails.env}"    
    raise 'You cannot run this in production' if Rails.env.production?

    job = Kiba.parse do
      source ETL::Sources::File, filename: args.file_path

      # Skip unhandled rows.
      transform ETL::Transformations::SkipUnwantedRows

      # Just the Organisation Records
      transform ETL::Transformations::JustYieldRow

      # Clean data.
      transform ETL::Transformations::AddHeaders
      transform ETL::Transformations::StringToDate
      transform ETL::Transformations::StringToTimestamp
      transform ETL::Transformations::SkipBlanks

      # Write it to the destination.
      destination ETL::Destinations::ActiveRecord, filename: args.file_path
    end

    Kiba.run(job)
  end
end
