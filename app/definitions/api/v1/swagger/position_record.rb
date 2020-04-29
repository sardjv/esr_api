class Api::V1::Swagger::PositionRecord
  def self.definitions
    {
      position_record_attributes: {
        type: 'object',
        properties: {
          'Position ID' => { type: 'string', example: 'ABC4401', 'x-nullable': true },
          'Effective From Date' => { type: 'date', example: '2019-04-22', 'x-nullable': true },
          'Effective To Date' => { type: 'date', example: nil, 'x-nullable': true },
          'Position Number' => { type: 'string', example: 'ABC5001', 'x-nullable': true },
          'Position Name' => { type: 'string', example: 'ABC5001|Core Trainee|001|', 'x-nullable': true},
          'Budgeted FTE' => { type: 'string', example: '3.53', 'x-nullable': true},
          'Subjective Code' => { type: 'string', example: 'ABC2101', 'x-nullable': true},
          'Job Staff Group' => { type: 'string', example: 'Medical and Dental', 'x-nullable': true},
          'Job Role' => { type: 'string', example: 'Specialty Registrar', 'x-nullable': true},
          'Occupation Code' => { type: 'string', example: '001', 'x-nullable': true},
          'Payscale' => { type: 'string', example: 'MN31', 'x-nullable': true},
          'Grade Step' => { type: 'string', example: 'MN31|0', 'x-nullable': true},
          'ISA Regulated Post' => { type: 'string', example: 'Not Applicable', 'x-nullable': true},
          'Organisation ID' => { type: 'string', example: '52001', 'x-nullable': true},
          'Hiring Status' => { type: 'string', example: 'Active', 'x-nullable': true},
          'Position Type' => { type: 'string', example: 'NONE', 'x-nullable': true},
          'Workplace Org Code' => { type: 'string', example: nil, 'x-nullable': true},
          'Last Update Date' => { type: 'date-time', example: '2019-10-03T12:17:01.000Z', 'x-nullable': true },
          'Subjective Code Description' => { type: 'string', example: 'RT Doctor', 'x-nullable': true},
        }
      },
      position_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'position_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/position_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      position_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'position_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/position_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/position_record_attributes' }
            }
          }
        }
      }
    }
  end
end
