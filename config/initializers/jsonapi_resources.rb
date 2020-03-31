JSONAPI.configure do |config|
  config.default_page_size = 5
  config.maximum_page_size = 10
  config.json_key_format = :underscored_key
  config.route_format = :underscored_route
end
