class Api::V1::AssignmentRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'AssignmentRecord'

  attributes *ETL::Headers::AssignmentRecord.api_headers
end
