class Api::V1::PersonRecordResource < JSONAPI::Resource
  model_name 'PersonRecord'

  attributes *ETL::Transformations::PersonRecord::HEADERS
end
