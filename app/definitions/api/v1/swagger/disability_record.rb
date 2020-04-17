class Api::V1::Swagger::DisabilityRecord
  def self.definitions
    {
      disability_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Disability ID' => { type: 'string', example: '654321', 'x-nullable': true },
          'Category' => { type: 'string', example: 'LOV', 'x-nullable': true },
          'Status' => { type: 'string', example: 'A', 'x-nullable': true }
        }
      },
      disability_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'disability_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/disability_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/disability_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/disability_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/disability_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/disability_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/disability_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      disability_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'disability_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/disability_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/disability_record_attributes' }
            }
          }
        }
      }
    }
  end
end
