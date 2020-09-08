module DataHelper
  def self.grouped_routes
    routes.group_by { |n| n[0].upcase }
  end

  def self.routes
    routes = Rails.application.routes.set.anchored_routes.map(&:defaults)
    controllers = routes.map { |r| r[:controller].starts_with?('ui/') ? r[:controller] : nil }
    controllers.compact.uniq.map { |c| c.split('ui/').last }
  end
end
