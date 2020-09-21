module PermissionHelper
  def self.column_options(resource:)
    return unless resource

    "ETL::Headers::#{resource}".constantize.api_headers
  end
end
