class Api::V1::PersonEitRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'PersonEITRecord'

  attributes *ETL::Headers::PersonEITRecord.api_headers
end
