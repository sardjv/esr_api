class Api::V1::PositionEitRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'PositionEITRecord'

  attributes *ETL::Headers::PositionEITRecord.api_headers
end
