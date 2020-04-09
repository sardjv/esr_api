require 'rails_helper'

class Api::V1::Swagger::Core
  def self.docs
    {
      'v1/swagger.json' => {
        swagger: '2.0',
        info: {
          title: 'ESR API',
          version: 'v1',
          description: 'This is the ESR API. For more information visit <a href="https://github.com/sardjv/esr_api">github.com/sardjv/esr_api</a>.'
        },
        # securityDefinitions: {
        #   apiToken: {
        #     type: :apiKey,
        #     name: 'X-API-TOKEN',
        #     in: :header
        #   },
        #   apiEmail: {
        #     type: :apiKey,
        #     name: 'X-API-EMAIL',
        #     in: :header
        #   }
        # },
        paths: {},
        definitions: definitions.inject(&:merge)
      }
    }
  end

  def self.definitions
    [
      Api::V1::Swagger::AbsenceRecord.definitions,
      Api::V1::Swagger::PersonRecord.definitions,
      Api::V1::Swagger::PositionRecord.definitions
    ]
  end
end
