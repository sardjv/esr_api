source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Looking to use the Edge version? gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2.1'

# Use Puma as the app server
gem 'puma', '~> 4.3.3'

# Use Rack Timeout. Read more: https://github.com/heroku/rack-timeout
gem 'rack-timeout', '~> 0.6'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.10'

# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 1.2.3'

# Use Redis Rails to set up a Redis backed Cache and / or Session
gem 'redis', '~> 4.1.3'

# Use Sidekiq as a background job processor through Active Job
gem 'sidekiq', '~> 6.0.5'

# Use Clockwork for recurring background tasks without needing cron
# gem 'clockwork', '~> 2.0'

# Use Kaminari for pagination
# gem 'kaminari', '~> 1.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'

# Use Uglifier as the compressor for JavaScript assets
gem 'uglifier', '~> 4.2.0'

# Use jQuery as the JavaScript library
gem 'jquery-rails', '~> 4.3.5'

# Use Turbolinks. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2.0'

# Use Bootstrap SASS for Bootstrap support
gem 'bootstrap-sass', '~> 3.4.1'

# Use Font Awesome Rails for Font Awesome icons
gem 'font-awesome-rails', '~> 4.7'

# Use Bootsnap to improve startup times
# gem 'bootsnap', '>= 1.1.0', require: false

# Data processing & ETL framework for Ruby.
# https://github.com/thbar/kiba
gem 'kiba', '~> 3.0.0'

group :development, :test do
  # Call 'byebug' anywhere in your code to drop into a debugger console
  gem 'byebug', platform: :mri

  # RSpec is a specification library for behaviour driven development.
  gem 'rspec-rails', '~> 4.0.0'

  # Fixtures replacement with a straightforward definition syntax.
  gem 'factory_bot', '~> 5.1.2'

  # A Ruby static code analyzer and formatter, based on the community Ruby style
  # guide.
  gem 'rubocop-rails', '~> 2.5.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '>= 2.15', '< 4.0'
  # gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'

  gem 'simplecov', '~> 0.18.5'
end

group :development do
  # Enable a debug toolbar to help profile your application
  gem 'rack-mini-profiler', '~> 2.0.1'

  # Access an IRB console on exception pages or by using <%= console %>
  # gem 'web-console', '~> 3.3.0'

  # Get notified of file changes. Read more: https://github.com/guard/listen
  # gem 'listen', '>= 3.0.5', '< 3.2'

  # Use Spring. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.1'

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
