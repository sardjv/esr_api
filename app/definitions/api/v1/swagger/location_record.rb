class Api::V1::Swagger::LocationRecord
  def self.definitions
    {
      location_record_attributes: {
        type: 'object',
        properties: {
          'Location ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Location Code' => { type: 'string', example: '070 z Maternity LWH', 'x-nullable': true },
          'Location Description' => { type: 'string', example: 'Maternity Town Hospital', 'x-nullable': true },
          'Inactive Date' => { type: 'date', example: nil, 'x-nullable': true },
          'Assignment Address 1st line' => { type: 'string', example: 'Maternity', 'x-nullable': true },
          'Assignment Address 2nd line' => { type: 'string', example: 'Town Wells Hospital', 'x-nullable': true },
          'Assignment Address 3rd line' => { type: 'string', example: nil, 'x-nullable': true },
          'Town' => { type: 'string', example: nil, 'x-nullable': true },
          'County' => { type: 'string', example: nil, 'x-nullable': true },
          'Postcode' => { type: 'string', example: nil, 'x-nullable': true },
          'Country' => { type: 'string', example: 'GB', 'x-nullable': true },
          'Telephone' => { type: 'string', example: nil, 'x-nullable': true },
          'Fax' => { type: 'string', example: nil, 'x-nullable': true },
          'Payslip Delivery Point' => { type: 'string', example: 'Y', 'x-nullable': true },
          'Site Code' => { type: 'string', example: nil, 'x-nullable': true },
          'Welsh Location Translation' => { type: 'string', example: nil, 'x-nullable': true },
          'Welsh Address Line 1' => { type: 'string', example: nil, 'x-nullable': true },
          'Welsh Address Line 2' => { type: 'string', example: nil, 'x-nullable': true },
          'Welsh Address Line 3' => { type: 'string', example: nil, 'x-nullable': true },
          'Welsh Town Translation' => { type: 'string', example: nil, 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2011-08-03T16:13:10.000Z', 'x-nullable': true }
        }
      },
      location_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'location_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/location_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/location_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/location_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/location_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/location_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/location_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      location_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'location_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/location_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/location_record_attributes' }
            }
          }
        }
      }
    }
  end
end
