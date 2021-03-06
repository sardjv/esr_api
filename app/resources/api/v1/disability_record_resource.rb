class Api::V1::DisabilityRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'DisabilityRecord'

  attributes(*ETL::Headers::DisabilityRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.map(&:to_sym)
  end
end
