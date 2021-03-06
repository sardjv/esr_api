class Api::V1::SitRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'SitRecord'

  attributes(*ETL::Headers::SitRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.map(&:to_sym)
  end
end
