class Api::V1::QualificationRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'QualificationRecord'

  attributes *ETL::Headers::QualificationRecord.api_headers
end
