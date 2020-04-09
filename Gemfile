source 'https://rubygems.org'

# Looking to use the Edge version? gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2.1'

# Use Puma as the app server
gem 'puma', '~> 4.3.3'

# Use Rack Timeout. Read more: https://github.com/heroku/rack-timeout
gem 'rack-timeout', '~> 0.6'

# Use MySQL as the database for Active Record.
# https://github.com/brianmario/mysql2
gem 'mysql2', '~> 0.5.3'

# Use Redis Rails to set up a Redis backed Cache and / or Session
gem 'redis', '~> 4.1.3'

# Use Sidekiq as a background job processor through Active Job
gem 'sidekiq', '~> 6.0.6'

# Use Clockwork for recurring background tasks without needing cron
# gem 'clockwork', '~> 2.0'

# Data processing & ETL framework for Ruby.
# https://github.com/thbar/kiba
gem 'kiba', '~> 3.0.0'

# Kiba companion gem for commonly-used helpers.
# https://github.com/thbar/kiba-common
gem 'kiba-common', '~> 1.0.0'

# Generate Swagger docs from RSpec tests.
gem 'rswag', '~> 2.3.0'

# A resource-focused Rails library for developing JSON:API compliant servers.
gem 'jsonapi-resources', '~> 0.10.2'

# Rack Middleware to bypass Cross-Origin Resource Sharing (CORS) protection for trusted endpoints.
gem 'rack-cors', '~> 1.1.1'

group :development, :test do
  # Call 'byebug' anywhere in your code to drop into a debugger console
  gem 'byebug', platform: :mri

  # RSpec is a specification library for behaviour driven development.
  gem 'rspec-rails', '~> 4.0.0'

  # Fixtures replacement with a straightforward definition syntax.
  gem 'factory_bot', '~> 5.1.2'

  # A Ruby static code analyzer and formatter, based on the community Ruby style
  # guide.
  gem 'rubocop-rails', '~> 2.5.1'
end

group :test do
  gem 'simplecov', '~> 0.18.5'

  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner-active_record', '~> 1.8.0'
  gem 'database_cleaner-redis', '~> 1.8.0'
end

group :development do
  # Enable a debug toolbar to help profile your application
  gem 'rack-mini-profiler', '~> 2.0.1'

  # This branch fixes an error caused by pry 0.13. When https://github.com/guard/guard/pull/955
  # is merged, remove this line and use guard-rspec to pull in latest guard. Can
  # also remove git from the dockerfile once this is done.
  gem 'guard', '~> 2.16.1', git: 'https://github.com/caseyprovost/guard'

  # Guard automates various tasks by running custom rules whenever file or
  # directories are modified.
  gem 'guard-rspec', '~> 4.7.3'

  # Automatically check Ruby code style with RuboCop when files are modified.
  gem 'guard-rubocop', '~> 1.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data'
