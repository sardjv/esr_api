include Rails.application.routes.url_helpers

desc 'Create jobs to import all files in the import/new directory'
# To run: bundle exec rake import_files[imports/new]
# imports/new is the directory containing the files.
# Files will be imported alphanumerically according to their filenames.
task :import_files, [:imports_path] => [:environment] do |_task, args|
  Rails.logger.info 'Starting...'

  path = Rails.root.join(args[:imports_path])

  Dir.each_child(path) do |filename|
    ImportFileJob.perform_later(filename: "#{path}/#{filename}")
  end

  Rails.logger.info 'Import jobs created!'
  Rails.logger.info "Visit #{sidekiq_web_path} to check the jobs and see when they're complete."
end
