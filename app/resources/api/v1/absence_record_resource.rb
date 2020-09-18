class Api::V1::AbsenceRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'AbsenceRecord'

  attributes(*ETL::Headers::AbsenceRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.split(',').map(&:to_sym)
  end
end
