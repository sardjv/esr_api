class Api::V1::AbsenceRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'AbsenceRecord'

  attributes *ETL::Headers::AbsenceRecord.non_blank_headers
end
