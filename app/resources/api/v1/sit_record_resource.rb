class Api::V1::SITRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'SITRecord'

  attributes *ETL::Headers::SITRecord.api_headers
end
