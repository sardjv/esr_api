ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Stdlib libraries that became bundled gems in Ruby 3.3+ but are referenced
# unconditionally by Rails 6.1. Require them eagerly so ActiveSupport boots.
%w[logger base64 bigdecimal mutex_m drb observer].each { |lib| require lib }
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
