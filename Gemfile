source 'https://rubygems.org'
ruby '3.0.0'

# Create database-backed web applications using the MVC pattern.
# https://github.com/rails/rails
gem 'rails', '~> 6.1.1'

# A Ruby/Rack web server built for concurrency.
# https://github.com/puma/puma
gem 'puma', '~> 5.2.0'

# Use MySQL as the database for Active Record.
# https://github.com/brianmario/mysql2
gem 'mysql2', '~> 0.5.3'

# A very fast key-value store to hold jobs until they are run.
# https://github.com/redis/redis-rb
gem 'redis', '~> 4.2.5'

# Simple, efficient background processing for Ruby.
# https://github.com/mperham/sidekiq
gem 'sidekiq', '~> 6.1.3'

# Data processing & ETL framework for Ruby.
# https://github.com/thbar/kiba
gem 'kiba', '~> 3.5.0'

# Kiba companion gem for commonly-used helpers.
# https://github.com/thbar/kiba-common
gem 'kiba-common', '~> 1.1.0'

# Serve Swagger documentation generated from RSpec tests.
# https://github.com/rswag/rswag
gem 'rswag-api', '~> 2.3.2'
gem 'rswag-ui', '~> 2.3.3'

# Use Webpack to manage app-like JavaScript modules in Rails.
# https://github.com/rails/webpacker
gem 'webpacker', '~> 5.2.1'

# A resource-focused Rails library for developing JSON:API compliant servers.
# https://github.com/cerebris/jsonapi-resources
# Use specified version until jsonapi-resources version after 0.10.2 is released.
# This is so we can use this PR https://github.com/cerebris/jsonapi-resources/pull/1346
# for Rails 6.1.1 compatibility.
gem 'jsonapi-resources', github: 'cerebris/jsonapi-resources', ref: 'eb432722b915e76914be9132e010a1244a32e91c'

# Bundle zoneinfo files which are not included in Windows.
# https://github.com/tzinfo/tzinfo-data
gem 'tzinfo-data', '~> 1.2021.1'

# A Rails engine that helps you put together a super-flexible admin dashboard.
# https://github.com/thoughtbot/administrate
gem 'administrate', '~> 0.14.0'

# A plugin for nested has_many forms in Administrate
# https://github.com/nickcharlton/administrate-field-nested_has_many
gem 'administrate-field-nested_has_many', '~> 1.3.0'

# Fixtures replacement with a straightforward definition syntax.
# https://github.com/thoughtbot/factory_bot
gem 'factory_bot', '~> 6.1.0'

# Generate fake data such as names, addresses, and phone numbers.
# https://github.com/faker-ruby/faker
gem 'faker', '~> 2.15.1'

# Simple plugin to add CSV export feature to Administrate.
# https://github.com/SourceLabsLLC/administrate_exportable
gem 'administrate_exportable', '~> 0.2.0'

# Flexible authentication solution for Rails with Warden.
# https://github.com/heartcombo/devise
gem 'devise', '~> 4.7.3'

# Modern encryption for Rails. Works with database fields, files, and strings.
# https://github.com/ankane/lockbox#active-record
gem 'lockbox', '~> 0.6.1'

# Securely search encrypted database fields.
# https://github.com/ankane/blind_index
gem 'blind_index'

# Track changes to your rails models.
# https://github.com/paper-trail-gem/paper_trail
gem 'paper_trail', '~> 11.1.0'

# Easy activity tracking for models - similar to Github's Public Activity.
# https://github.com/chaps-io/public_activity
gem 'public_activity', '~> 1.6.4'

group :development, :test do
  # Call 'binding.pry' anywhere in your code to drop into a debugger console.
  # https://github.com/pry/pry
  gem 'pry', '~> 0.13.1'

  # Generate Swagger docs from RSpec tests.
  # https://github.com/rswag/rswag
  gem 'rswag-specs', '~> 2.3.2'
end

group :development do
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
  gem 'license_finder', '~> 6.10.1'
end

group :test do
  # RSpec is a specification library for behaviour driven development.
  # https://github.com/rspec/rspec
  gem 'rspec-rails', '~> 4.0.2'

  # Generate code coverage documentation.
  # https://github.com/colszowka/simplecov
  gem 'simplecov', '~> 0.21.2'

  # Simple one-liner tests for common Rails functionality.
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 4.5.1'

  # Strategies for cleaning databases between tests.
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner-active_record', '~> 2.0.0'
end
