module PermissionHelper
  def self.column_options(resource:)
    return unless resource

    "ETL::Headers::#{resource}".constantize.api_headers
  end

  def self.column_options_for_select2(resource:)
    return unless resource

    column_options(resource: resource).map do |text|
      { 'id' => text, 'text' => text }
    end
  end
end
