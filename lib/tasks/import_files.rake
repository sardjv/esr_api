include Rails.application.routes.url_helpers

desc 'Create jobs to import all files in the given directory'
# To run: bundle exec rake import_files[imports/new]
# where imports/new is the directory containing the files.
# All filenames must finish with a timestamp in the correct format.
# Import jobs will be created in the order of the timestamps.
task :import_files, [:imports_path] => [:environment] do |_task, args|
  Rails.logger.info 'Starting...'

  path = Rails.root.join(args[:imports_path])
  filenames = Dir.children(path)

  raise InvalidFilenameError unless filenames.all? do |f|
    Rails.logger.info "Checking #{f} has a valid timestamp in the filename..."
    valid_filename_regex.match?(f)
  end

  filenames = sort_by_timestamp(filenames)

  filenames.each do |filename|
    ImportFileJob.perform_later(filename: "#{path}/#{filename}")
  end

  Rails.logger.info 'Import jobs created!'
  Rails.logger.info "Visit #{sidekiq_web_path} to check the jobs and see when they're complete."
end

private

def valid_filename_regex
  # Check that filename ends in the format YYYYMMDD_IIIIIIII.DAT.
  # IIIIIII is presumably HHMMSSSS, or similar, haven't quite figured that out yet.
  # Example valid seed file: GO_277_GDW_GOF_20200602_00001632.DAT
  # Example valid delta file: GO_277_GDW_GOC_20200603_00001633.DAT
  Regexp.new('.*([0-9]{4})(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])_([0-9]{8}).DAT')
end

def sort_by_timestamp(filenames)
  filenames.sort_by { |f| f.scan(valid_filename_regex) }
end