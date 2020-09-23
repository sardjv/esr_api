class Api::V1::PositionRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'PositionRecord'

  attributes(*ETL::Headers::PositionRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.split(',').map(&:to_sym)
  end
end
