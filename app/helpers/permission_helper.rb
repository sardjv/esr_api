module PermissionHelper
  def self.column_options(resource:)
    return unless resource

    "ETL::Headers::#{resource}".constantize.api_headers
  end

  def self.column_options_for_select2(resource:)
    return unless resource

    {
      'results' => column_options(resource: resource).map.with_index do |text, id|
        { 'id' => id, 'text' => text }
      end
    }
  end
end
