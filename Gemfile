source 'https://rubygems.org'

# Create database-backed web applications using the MVC pattern.
# https://github.com/rails/rails
gem 'rails', '~> 6.0.3'

# A Ruby/Rack web server built for concurrency.
# https://github.com/puma/puma
gem 'puma', '~> 4.3.5'

# Use PostgreSQL as the database for Active Record.
# https://github.com/ged/ruby-pg
# gem 'pg', '~> 1.2.3'

# Use MySQL as the database for Active Record.
# https://github.com/brianmario/mysql2
gem 'mysql2', '~> 0.5.3'

# FreeTDS bindings for Ruby, required for SQL Server.
# https://github.com/rails-sqlserver/tiny_tds
# Ruby 2.6/2.7 compatibility under development, bump the version when merged:
# https://github.com/rails-sqlserver/tiny_tds/pull/462
# gem 'tiny_tds', '~> 2.1.3-pre'

# Use SQL Server as the database for Active Record.
# https://github.com/rails-sqlserver/activerecord-sqlserver-adapter
# Rails 6 compatibility is under development, remove the branch reference when merged:
# https://github.com/rails-sqlserver/activerecord-sqlserver-adapter/pull/690
# gem 'activerecord-sqlserver-adapter', git: 'https://github.com/rails-sqlserver/activerecord-sqlserver-adapter', branch: '6-0-dev'

# A very fast key-value store to hold jobs until they are run.
# https://github.com/redis/redis-rb
gem 'redis', '~> 4.1.4'

# Simple, efficient background processing for Ruby.
# https://github.com/mperham/sidekiq
gem 'sidekiq', '~> 6.0.7'

# Data processing & ETL framework for Ruby.
# https://github.com/thbar/kiba
gem 'kiba', '~> 3.0.0'

# Kiba companion gem for commonly-used helpers.
# https://github.com/thbar/kiba-common
gem 'kiba-common', '~> 1.0.0'

# Serve Swagger documentation generated from RSpec tests.
# https://github.com/rswag/rswag
gem 'rswag-api', '~> 2.3.1'
gem 'rswag-ui', '~> 2.3.1'

# Use Webpack to manage app-like JavaScript modules in Rails.
# https://github.com/rails/webpacker
gem 'webpacker', '~> 5.1.1'

# A resource-focused Rails library for developing JSON:API compliant servers.
# https://github.com/cerebris/jsonapi-resources
gem 'jsonapi-resources', '~> 0.10.2'

# Bundle zoneinfo files which are not included in Windows.
# https://github.com/tzinfo/tzinfo-data
gem 'tzinfo-data', '~> 1.2020.1'

# A Rails engine that helps you put together a super-flexible admin dashboard.
# https://github.com/thoughtbot/administrate
# Use master branch until 0.14.0 is available, for https://github.com/thoughtbot/administrate/pull/1574.
gem 'administrate', github: 'thoughtbot/administrate', branch: 'master'

# OmniAuth is a flexible authentication system utilizing Rack middleware.
# https://github.com/auth0/omniauth-auth0
gem 'omniauth-auth0', '~> 2.3.1'

# Provides CSRF protection on OmniAuth request endpoint on Rails application.
# https://github.com/cookpad/omniauth-rails_csrf_protection
gem 'omniauth-rails_csrf_protection', '~> 0.1.2'

# Fixtures replacement with a straightforward definition syntax.
# https://github.com/thoughtbot/factory_bot
gem 'factory_bot', '~> 5.2.0'

# Generate fake data such as names, addresses, and phone numbers.
# https://github.com/faker-ruby/faker
gem 'faker', '~> 2.11.0'

# Simple plugin to add CSV export feature to Administrate.
# https://github.com/SourceLabsLLC/administrate_exportable
gem 'administrate_exportable', '~> 0.2.0'

group :development, :test do
  # Call 'byebug' anywhere in your code to drop into a debugger console.
  # https://github.com/deivid-rodriguez/byebug
  gem 'byebug', '~> 11.1.3', platform: :mri

  # Generate Swagger docs from RSpec tests.
  # https://github.com/rswag/rswag
  gem 'rswag-specs', '~> 2.3.1'
end

group :development do
  # Automates various tasks by running custom rules when files are changed.
  # https://github.com/guard/guard-rspec
  gem 'guard-rspec', '~> 4.7.3'

  # Automatically check Ruby code style with RuboCop when files are modified.
  # https://github.com/yujinakayama/guard-rubocop
  gem 'guard-rubocop', '~> 1.3.0'

  # A static code analyzer and formatter, based on the community style guide.
  # https://github.com/rubocop-hq/rubocop-rails
  gem 'rubocop-rails', '~> 2.5.1'
end

group :test do
  # RSpec is a specification library for behaviour driven development.
  # https://github.com/rspec/rspec
  gem 'rspec-rails', '~> 4.0.1'

  # Generate code coverage documentation.
  # https://github.com/colszowka/simplecov
  gem 'simplecov', '~> 0.18.5'

  # Strategies for cleaning databases between tests.
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner-active_record', '~> 1.8.0'
  gem 'database_cleaner-redis', '~> 1.8.0'
end
