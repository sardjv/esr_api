class Api::V1::LocationRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'LocationRecord'

  attributes *ETL::Headers::LocationRecord.api_headers
end
