JSONAPI.configure do |config|
  config.default_paginator = :paged
  config.default_page_size = 10
  config.maximum_page_size = 20
  config.json_key_format = :underscored_key
  config.route_format = :underscored_route
end
