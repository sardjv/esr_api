# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# rubocop:disable Rails/OutputSafety
# Remove field_with_errors as they mess up NHS frontend rendering.
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.html_safe
end
# rubocop:enable Rails/OutputSafety
