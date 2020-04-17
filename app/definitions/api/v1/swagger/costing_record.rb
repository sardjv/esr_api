class Api::V1::Swagger::CostingRecord
  def self.definitions
    {
      costing_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Assignment ID' => { type: 'string', example: '937490', 'x-nullable': true },
          'Costing Allocation ID' => { type: 'string', example: '5507703', 'x-nullable': true },
          'Effective Start Date' => { type: 'date', example: '2011-03-08', 'x-nullable': true },
          'Effective End Date' => { type: 'date', example: '4712-12-31', 'x-nullable': true },
          'Entity Code' => { type: 'string', example: 'ABC', 'x-nullable': true },
          'Charitable Indicator' => { type: 'string', example: nil, 'x-nullable': true },
          'Cost Centre' => { type: 'string', example: nil, 'x-nullable': true },
          'Subjective' => { type: 'string', example: '0702K161', 'x-nullable': true },
          'Analysis 1' => { type: 'string', example: nil, 'x-nullable': true },
          'Analysis 2' => { type: 'string', example: nil, 'x-nullable': true },
          'Element Number' => { type: 'string', example: nil, 'x-nullable': true },
          'Spare Segment' => { type: 'string', example: nil, 'x-nullable': true },
          'Percentage Split' => { type: 'string', example: '1', 'x-nullable': true }
        }
      },
      costing_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'costing_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/costing_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/costing_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/costing_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/costing_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/costing_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/costing_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      costing_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'costing_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/costing_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/costing_record_attributes' }
            }
          }
        }
      }
    }
  end
end
