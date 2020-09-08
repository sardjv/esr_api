module DataHelper
  def self.grouped_routes
    routes.group_by { |n| n[:name][0].upcase }
  end

  def self.routes
    routes = Rails.application.routes.set.anchored_routes.map(&:defaults)
    routes = routes.map { |r| r[:controller].starts_with?('ui/') ? r[:controller] : nil }.compact.uniq
    routes.map { |r| { name: r.split('ui/').last.titleize, path: r } }
  end
end
