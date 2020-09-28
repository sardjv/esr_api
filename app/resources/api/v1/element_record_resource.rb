class Api::V1::ElementRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'ElementRecord'

  attributes(*ETL::Headers::ElementRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.map(&:to_sym)
  end
end
