class Api::V1::TrainingAbsenceRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'TrainingAbsenceRecord'

  attributes(*ETL::Headers::TrainingAbsenceRecord.api_headers)

  def fetchable_fields
    context[:credentials][:permission].columns.map(&:to_sym)
  end
end
