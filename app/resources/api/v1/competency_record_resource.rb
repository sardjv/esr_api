class Api::V1::CompetencyRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'CompetencyRecord'

  attributes(*ETL::Headers::CompetencyRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.map(&:to_sym)
  end
end
