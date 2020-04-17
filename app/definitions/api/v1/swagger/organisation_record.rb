class Api::V1::Swagger::OrganisationRecord
  def self.definitions
    {
      organisation_record_attributes: {
        type: 'object',
        properties: {
          'Organisation ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Organisation Name' => { type: 'string', example: '070 6 Domestic (BRO)', 'x-nullable': true },
          'Organisation Type' => { type: 'string', example: 'NHS_TM', 'x-nullable': true },
          'Effective From Date' => { type: 'date', example: '1951-01-01', 'x-nullable': true },
          'Effective To Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Hierarchy Version ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Hierarchy Version Date From' => { type: 'string', example: nil, 'x-nullable': true },
          'Hierarchy Version Date To' => { type: 'string', example: nil, 'x-nullable': true },
          'Default Cost Centre' => { type: 'string', example: '070E642', 'x-nullable': true },
          'Parent Organisation ID' => { type: 'string', example: '548444', 'x-nullable': true },
          'NACS Code' => { type: 'string', example: nil, 'x-nullable': true },
          'Location ID' => { type: 'string', example: '96804', 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2006-10-19T23:36:01.000Z', 'x-nullable': true },
          'Cost Centre Description' => { type: 'string', example: '070E642', 'x-nullable': true }
        }
      },
      organisation_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'organisation_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/organisation_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/organisation_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/organisation_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/organisation_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/organisation_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/organisation_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      organisation_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'organisation_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/organisation_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/organisation_record_attributes' }
            }
          }
        }
      }
    }
  end
end
