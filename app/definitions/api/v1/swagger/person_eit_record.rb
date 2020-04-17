class Api::V1::Swagger::PersonEITRecord
  def self.definitions
    {
      person_eit_record_attributes: {
        type: 'object',
        properties: {

        }
      },
      person_eit_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'person_eit_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/person_eit_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      person_eit_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'person_eit_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/person_eit_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/person_eit_record_attributes' }
            }
          }
        }
      }
    }
  end
end
