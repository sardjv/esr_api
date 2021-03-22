module DataHelper
  def self.models
    routes.map { |h| h[:name].gsub(' ', '').singularize }
  end

  def self.grouped_routes
    routes.group_by { |n| n[:name][0].upcase }
  end

  # Returns only the routes that we expose for the API; no platform admin routes.
  def self.routes
    data_routes.map { |r| { name: r.split('ui/').last.titleize, path: r.split('ui/').last } }
  end

  private_class_method def self.data_routes
    ui_routes.reject do |r|
      %w[ui/activities ui/data ui/events ui/imports ui/permissions ui/ftp_credentials ui/tokens ui/users].include?(r)
    end
  end

  private_class_method def self.ui_routes
    default_routes.map { |r| r[:controller]&.starts_with?('ui/') ? r[:controller] : nil }.compact.uniq
  end

  private_class_method def self.default_routes
    Rails.application.routes.set.anchored_routes.map(&:defaults)
  end
end
