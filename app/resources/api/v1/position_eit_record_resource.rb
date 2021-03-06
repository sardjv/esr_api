class Api::V1::PositionEitRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'PositionEitRecord'

  attributes(*ETL::Headers::PositionEitRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.map(&:to_sym)
  end
end
