class Api::V1::Swagger::PersonRecord
  def self.definitions
    {
      person_record_attributes: {
        type: 'object',
        properties: {
          PersonID: { type: 'string', example: '1234ABCD' }
        }
      },
      person_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'person_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/person_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=1&per_page=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=1&per_page=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=3&per_page=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=5&per_page=5' }
            }
          }
        }
      },
      person_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'person_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/person_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/person_record_attributes' }
            }
          }
        }
      }
    }
  end
end
