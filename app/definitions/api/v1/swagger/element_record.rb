class Api::V1::Swagger::ElementRecord
  def self.definitions
    {
      element_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Element Entry ID' => { type: 'string', example: '7105629', 'x-nullable': true },
          'Effective Start Date' => { type: 'date', example: '2011-12-12', 'x-nullable': true },
          'Effective End Date' => { type: 'date', example: '2011-12-12', 'x-nullable': true },
          'Element Entry Type' => { type: 'string', example: 'E', 'x-nullable': true },
          'Assignment ID' => { type: 'string', example: '123456', 'x-nullable': true },
          'Element Type ID' => { type: 'string', example: '4321', 'x-nullable': true },
          'Element Type Name' => { type: 'string', example: 'AfC Annual Leave Accrual 1NHS', 'x-nullable': true },
          'Earned Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Entry Value 1' => { type: 'string', example: '203', 'x-nullable': true },
          'Entry Value 2' => { type: 'string', example: '203', 'x-nullable': true },
          'Entry Value 3' => { type: 'string', example: '203', 'x-nullable': true },
          'Entry Value 4' => { type: 'string', example: '203', 'x-nullable': true },
          'Entry Value 5' => { type: 'string', example: '203', 'x-nullable': true },
          'Entry Value 6' => { type: 'string', example: '218', 'x-nullable': true },
          'Entry Value 7' => { type: 'string', example: '218', 'x-nullable': true },
          'Entry Value 8' => { type: 'string', example: ' 218', 'x-nullable': true },
          'Entry Value 9' => { type: 'string', example: '218', 'x-nullable': true },
          'Entry Value 10' => { type: 'string', example: '218', 'x-nullable': true },
          'Entry Value 11' => { type: 'string', example: '248', 'x-nullable': true },
          'Entry Value 12' => { type: 'string', example: '248', 'x-nullable': true },
          'Entry Value 13' => { type: 'string', example: '248', 'x-nullable': true },
          'Entry Value 14' => { type: 'string', example: '248', 'x-nullable': true },
          'Entry Value 15' => { type: 'string', example: '248', 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2005-10-22T06:34:28.000Z', 'x-nullable': true }
        }
      },
      element_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'element_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/element_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/element_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/element_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/element_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/element_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/element_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      element_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'element_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/element_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/element_record_attributes' }
            }
          }
        }
      }
    }
  end
end
