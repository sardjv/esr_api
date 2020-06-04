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
        securityDefinitions: {
          JWT: {
            description: 'The JSON Web Token from Auth0 for authentication.',
            type: :apiKey,
            name: 'Authorization',
            in: :header
          }
        },
        paths: {},
        definitions: definitions.inject(&:merge)
      }
    }
  end

  def self.definitions
    [
      Api::V1::Swagger::AbsenceRecord.definitions,
      Api::V1::Swagger::AssignmentRecord.definitions,
      Api::V1::Swagger::CompetencyRecord.definitions,
      Api::V1::Swagger::CostingRecord.definitions,
      Api::V1::Swagger::DisabilityRecord.definitions,
      Api::V1::Swagger::ElementRecord.definitions,
      Api::V1::Swagger::LocationRecord.definitions,
      Api::V1::Swagger::OrganisationRecord.definitions,
      Api::V1::Swagger::PersonEitRecord.definitions,
      Api::V1::Swagger::PersonRecord.definitions,
      Api::V1::Swagger::PositionEitRecord.definitions,
      Api::V1::Swagger::PositionRecord.definitions,
      Api::V1::Swagger::QualificationRecord.definitions,
      Api::V1::Swagger::SitRecord.definitions,
      Api::V1::Swagger::TrainingAbsenceRecord.definitions
    ]
  end
end
