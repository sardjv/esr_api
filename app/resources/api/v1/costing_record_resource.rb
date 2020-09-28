class Api::V1::CostingRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'CostingRecord'

  attributes(*ETL::Headers::CostingRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.map(&:to_sym)
  end
end
