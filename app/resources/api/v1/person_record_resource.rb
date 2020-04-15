class Api::V1::PersonRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'PersonRecord'

  attributes *ETL::Headers::PersonRecord.api_headers
end
