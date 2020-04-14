class Api::V1::PositionRecordResource < JSONAPI::Resource
  immutable # Remove POST and PUT endpoints.

  model_name 'PositionRecord'

  attributes *ETL::Headers::PositionRecord.non_blank_headers
end
