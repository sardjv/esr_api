class Api::V1::OrganisationRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'OrganisationRecord'

  attributes(*ETL::Headers::OrganisationRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.split(',').map(&:to_sym)
  end
end
