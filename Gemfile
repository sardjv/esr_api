source 'https://rubygems.org'
ruby '3.0.0'

# Create database-backed web applications using the MVC pattern.
# https://github.com/rails/rails
gem 'rails', '~> 6.1.3'

# A Ruby/Rack web server built for concurrency.
# https://github.com/puma/puma
gem 'puma', '~> 5.5.0'

# Use MySQL as the database for Active Record.
# https://github.com/brianmario/mysql2
gem 'mysql2', '~> 0.5.3'

# A very fast key-value store to hold jobs until they are run.
# https://github.com/redis/redis-rb
gem 'redis', '~> 4.4.0'

# Simple, efficient background processing for Ruby.
# https://github.com/mperham/sidekiq
gem 'sidekiq', '~> 6.2.2'

# Data processing & ETL framework for Ruby.
# https://github.com/thbar/kiba
gem 'kiba', '~> 4.0.0'

# Kiba companion gem for commonly-used helpers.
# https://github.com/thbar/kiba-common
gem 'kiba-common', '~> 1.5.0'

# Serve Swagger documentation generated from RSpec tests.
# https://github.com/rswag/rswag
gem 'rswag-api', '~> 2.4.0'
gem 'rswag-ui', '~> 2.4.0'

# Use Webpack to manage app-like JavaScript modules in Rails.
# https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4.3'

# A resource-focused Rails library for developing JSON:API compliant servers.
# https://github.com/cerebris/jsonapi-resources
gem 'jsonapi-resources', '~> 0.10.4'

# Bundle zoneinfo files which are not included in Windows.
# https://github.com/tzinfo/tzinfo-data
gem 'tzinfo-data', '~> 1.2021.5'

# A Rails engine that helps you put together a super-flexible admin dashboard.
# https://github.com/thoughtbot/administrate
gem 'administrate', '~> 0.16.0'

# A plugin for nested has_many forms in Administrate
# https://github.com/nickcharlton/administrate-field-nested_has_many
gem 'administrate-field-nested_has_many', '~> 1.3.0'

# Fixtures replacement with a straightforward definition syntax.
# https://github.com/thoughtbot/factory_bot
gem 'factory_bot', '~> 6.2.0'

# Generate fake data such as names, addresses, and phone numbers.
# https://github.com/faker-ruby/faker
gem 'faker', '~> 2.19.0'

# Simple plugin to add CSV export feature to Administrate.
# https://github.com/SourceLabsLLC/administrate_exportable
gem 'administrate_exportable', '~> 0.5.0'

# Flexible authentication solution for Rails with Warden.
# https://github.com/heartcombo/devise
gem 'devise', '~> 4.8.0'

# Modern encryption for Rails. Works with database fields, files, and strings.
# https://github.com/ankane/lockbox#active-record
gem 'lockbox', '~> 0.6.6'

# Securely search encrypted database fields.
# https://github.com/ankane/blind_index
gem 'blind_index', '~> 2.2.0'

# Track changes to your rails models.
# https://github.com/paper-trail-gem/paper_trail
gem 'paper_trail', '~> 12.1.0'

# Easy activity tracking for models - similar to Github's Public Activity.
# https://github.com/chaps-io/public_activity
gem 'public_activity', '~> 1.6.4'

# Scheduler / Cron for Sidekiq jobs.
# https://github.com/ondrejbartas/sidekiq-cron
gem 'sidekiq-cron', '~> 1.2.0'

group :development, :test do
  # Call 'binding.pry' anywhere in your code to drop into a debugger console.
  # https://github.com/pry/pry
  gem 'pry', '~> 0.14.1'

  # Generate Swagger docs from RSpec tests.
  # https://github.com/rswag/rswag
  gem 'rswag-specs', '~> 2.4.0'
end

group :development do
  # Annotate Rails classes with schema and routes info.
  # https://github.com/ctran/annotate_models
  gem 'annotate', '~> 3.1.1'

  # Automates various tasks by running custom rules when files are changed.
  # https://github.com/guard/guard-rspec
  gem 'guard-rspec', '~> 4.7.3'

  # Automatically check Ruby code style with RuboCop when files are modified.
  # https://github.com/yujinakayama/guard-rubocop
  gem 'guard-rubocop', '~> 1.4.0'

  # A static code analyzer and formatter, based on the community style guide.
  # https://github.com/rubocop-hq/rubocop-rails
  gem 'rubocop-rails', '~> 2.9.1'

  # Tool to check dependency licenses.
  # https://github.com/pivotal/LicenseFinder
  gem 'license_finder', '~> 6.14.1'
end

group :test do
  # Acceptance test framework for web applications.
  # https://github.com/teamcapybara/capybara
  gem 'capybara', '~> 3.35.3'

  # Strategies for cleaning databases between tests.
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner-active_record', '~> 2.0.1'

  # Test your FTP calls offline.
  # https://github.com/thejamespinto/ftpmock
  gem 'ftpmock', '~> 0.1.1'

  # RSpec results that your CI can read.
  # https://github.com/sj26/rspec_junit_formatter
  gem 'rspec_junit_formatter', '~> 0.4.1'

  # RSpec is a specification library for behaviour driven development.
  # https://github.com/rspec/rspec
  gem 'rspec-rails', '~> 5.0.2'

  # Generate code coverage documentation.
  # https://github.com/colszowka/simplecov
  gem 'simplecov', '~> 0.21.2'

  # Simple one-liner tests for common Rails functionality.
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 5.0.0'

  # Provides 'time travel' capabilities, making it simple to test time-dependent code.
  # https://github.com/travisjeffery/timecop
  gem 'timecop', '~> 0.9.4'
end
