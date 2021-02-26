module NavHelper
  class << self
    include Rails.application.routes.url_helpers
  end

  # Currently we only support 1 source.
  def self.singleton_source_path
    Source.singleton ? ui_source_path(Source.singleton) : new_ui_source_path
  end
end
