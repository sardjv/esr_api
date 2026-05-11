source 'https://rubygems.org'
ruby '3.3.6'

# Stdlib gems that became bundled gems in Ruby 3.3+ — declare explicitly so
# Rails 6.1 and friends can require them. See https://github.com/rails/rails/issues/54260
gem 'base64'
gem 'bigdecimal'
gem 'csv'
gem 'drb'
gem 'logger'
gem 'mutex_m'
gem 'net-ftp'
gem 'observer'
gem 'ostruct'

# Create database-backed web applications using the MVC pattern.
# https://github.com/rails/rails
gem 'rails', '~> 6.1.7'

# A Ruby/Rack web server built for concurrency.
# https://github.com/puma/puma
gem 'puma', '~> 5.6'

# Use MySQL as the database for Active Record.
# https://github.com/brianmario/mysql2
gem 'mysql2', '~> 0.5'

# A very fast key-value store to hold jobs until they are run.
# https://github.com/redis/redis-rb
gem 'redis', '~> 4.8'

# Simple, efficient background processing for Ruby.
# https://github.com/mperham/sidekiq
gem 'sidekiq', '~> 6.5'

# Data processing & ETL framework for Ruby.
# https://github.com/thbar/kiba
gem 'kiba', '~> 4.0'

# Kiba companion gem for commonly-used helpers.
# https://github.com/thbar/kiba-common
gem 'kiba-common', '~> 1.5'

# Serve Swagger documentation generated from RSpec tests.
# https://github.com/rswag/rswag
gem 'rswag-api', '~> 2.13'
gem 'rswag-ui', '~> 2.13'

# Use Webpack to manage app-like JavaScript modules in Rails.
# https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4'

# A resource-focused Rails library for developing JSON:API compliant servers.
# https://github.com/cerebris/jsonapi-resources
# NOTE: 0.10.5+ introduced a `sql_field_with_alias` helper that emits
# ANSI-quoted identifiers (e.g. `."id"`), which MySQL parses as a syntax
# error. Pin to 0.10.4 until upstream fixes the quoting strategy.
gem 'jsonapi-resources', '0.10.4'

# Bundle zoneinfo files which are not included in Windows.
# https://github.com/tzinfo/tzinfo-data
gem 'tzinfo-data'

# A Rails engine that helps you put together a super-flexible admin dashboard.
# https://github.com/thoughtbot/administrate
# Pinned to 0.19.x — 0.20+ drops Rails 6.1 support.
gem 'administrate', '~> 0.19.0'

# A plugin for nested has_many forms in Administrate
# https://github.com/nickcharlton/administrate-field-nested_has_many
gem 'administrate-field-nested_has_many', '~> 1.3'

# Fixtures replacement with a straightforward definition syntax.
# https://github.com/thoughtbot/factory_bot
gem 'factory_bot', '~> 6.5'

# Generate fake data such as names, addresses, and phone numbers.
# https://github.com/faker-ruby/faker
gem 'faker', '~> 3.5'

# Simple plugin to add CSV export feature to Administrate.
# https://github.com/SourceLabsLLC/administrate_exportable
gem 'administrate_exportable', '~> 0.5'

# Flexible authentication solution for Rails with Warden.
# https://github.com/heartcombo/devise
gem 'devise', '~> 5.0', '>= 5.0.4'

# Modern encryption for Rails. Works with database fields, files, and strings.
# https://github.com/ankane/lockbox#active-record
gem 'lockbox', '~> 1.3'

# Securely search encrypted database fields.
# https://github.com/ankane/blind_index
gem 'blind_index', '~> 2.4'

# Track changes to your rails models.
# https://github.com/paper-trail-gem/paper_trail
gem 'paper_trail', '~> 14.0'

# Easy activity tracking for models - similar to Github's Public Activity.
# https://github.com/chaps-io/public_activity
gem 'public_activity', '~> 2.0'

# Scheduler / Cron for Sidekiq jobs.
# https://github.com/ondrejbartas/sidekiq-cron
gem 'sidekiq-cron', '~> 2.4', '>= 2.4.0'

# Bootsnap optimizes Rails app boot time.
# https://github.com/Shopify/bootsnap
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'binding.pry' anywhere in your code to drop into a debugger console.
  # https://github.com/pry/pry
  gem 'pry', '~> 0.15'

  # Generate Swagger docs from RSpec tests.
  # https://github.com/rswag/rswag
  gem 'rswag-specs', '~> 2.13'
end

group :development do
  # Annotate Rails classes with schema and routes info.
  # https://github.com/ctran/annotate_models
  gem 'annotate', '~> 3.2'

  # Automates various tasks by running custom rules when files are changed.
  # https://github.com/guard/guard-rspec
  gem 'guard-rspec', '~> 4.7'

  # Automatically check Ruby code style with RuboCop when files are modified.
  # https://github.com/yujinakayama/guard-rubocop
  gem 'guard-rubocop', '~> 1.5'

  # A static code analyzer and formatter, based on the community style guide.
  # https://github.com/rubocop-hq/rubocop-rails
  gem 'rubocop-rails', '~> 2.27'

  # Tool to check dependency licenses.
  # https://github.com/pivotal/LicenseFinder
  gem 'license_finder', '~> 7.0'
end

group :test do
  # Acceptance test framework for web applications.
  # https://github.com/teamcapybara/capybara
  gem 'capybara', '~> 3.40'

  # Strategies for cleaning databases between tests.
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner-active_record', '~> 2.2'

  # Test your FTP calls offline.
  # https://github.com/thejamespinto/ftpmock
  gem 'ftpmock', '~> 0.1'

  # RSpec results that your CI can read.
  # https://github.com/sj26/rspec_junit_formatter
  gem 'rspec_junit_formatter', '~> 0.6'

  # RSpec is a specification library for behaviour driven development.
  # https://github.com/rspec/rspec
  gem 'rspec-rails', '~> 6.0'

  # Generate code coverage documentation.
  # https://github.com/colszowka/simplecov
  gem 'simplecov', '~> 0.22'

  # Simple one-liner tests for common Rails functionality.
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 6.4'

  # Provides 'time travel' capabilities, making it simple to test time-dependent code.
  # https://github.com/travisjeffery/timecop
  gem 'timecop', '~> 0.9'
end
