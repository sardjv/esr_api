class Api::V1::QualificationRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'QualificationRecord'

  attributes(*ETL::Headers::QualificationRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.split(',').map(&:to_sym)
  end
end
