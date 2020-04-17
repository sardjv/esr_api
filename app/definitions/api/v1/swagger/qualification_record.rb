class Api::V1::Swagger::QualificationRecord
  def self.definitions
    {
      qualification_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Qualification ID' => { type: 'string', example: '4698382', 'x-nullable': true },
          'Qualification Type' => { type: 'string', example: 'Bachelors Degree', 'x-nullable': true },
          'Title' => { type: 'string', example: 'Occupational Therapy', 'x-nullable': true },
          'Status' => { type: 'string', example: 'ATTAIN', 'x-nullable': true },
          'Grade' => { type: 'string', example: '02:01', 'x-nullable': true },
          'Awarded Date' => { type: 'date', example: '2010-07-07', 'x-nullable': true },
          'Start Date' => { type: 'string', example: nil, 'x-nullable': true },
          'End Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Establishment' => { type: 'string', example: 'City University', 'x-nullable': true },
          'Country' => { type: 'string', example: 'UK', 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2010-10-18T14:24:15.000Z', 'x-nullable': true }
        }
      },
      qualification_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'qualification_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/qualification_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/qualification_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/qualification_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/qualification_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/qualification_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/qualification_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      qualification_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'qualification_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/qualification_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/qualification_record_attributes' }
            }
          }
        }
      }
    }
  end
end
