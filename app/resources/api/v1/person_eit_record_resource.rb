class Api::V1::PersonEitRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'PersonEitRecord'

  attributes *ETL::Headers::PersonEitRecord.api_headers
end
