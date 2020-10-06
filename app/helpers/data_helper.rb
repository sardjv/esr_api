module DataHelper
  def self.models
    routes.map { |h| h[:name].gsub(' ', '').singularize }
  end

  def self.grouped_routes
    routes.group_by { |n| n[:name][0].upcase }
  end

  def self.routes
    routes = Rails.application.routes.set.anchored_routes.map(&:defaults)
    routes = routes.map { |r| r[:controller].starts_with?('ui/') ? r[:controller] : nil }
    routes = routes.compact.uniq
    routes = routes.reject { |r| %w[ui/activities ui/data ui/tokens ui/users].include?(r) }
    routes.map { |r| { name: r.split('ui/').last.titleize, path: r.split('ui/').last } }
  end
end
