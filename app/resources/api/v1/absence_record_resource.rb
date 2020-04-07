class Api::V1::AbsenceRecordResource < JSONAPI::Resource
  model_name 'AbsenceRecord'

  attributes *ETL::Headers::AbsenceRecord.all
end
