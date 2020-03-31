class Api::V1::PersonRecordResource < JSONAPI::Resource
  model_name 'PersonRecord'

  attributes :PersonID
end
