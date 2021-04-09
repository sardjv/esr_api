class Api::V1::CompetenceDefinitionRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'CompetenceDefinitionRecord'

  attributes(*ETL::Headers::CompetenceDefinitionRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.map(&:to_sym)
  end
end
