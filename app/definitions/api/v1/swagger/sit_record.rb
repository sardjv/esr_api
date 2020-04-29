class Api::V1::Swagger::SitRecord
  def self.definitions
    {
      sit_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Special Information ID' => { type: 'string', example: '2075698', 'x-nullable': true },
          'Effective Start Date' => { type: 'date', example: '2009-04-20', 'x-nullable': true },
          'Effective End Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Information Type' => { type: 'string', example: 'NHS_REC_CHECKLIST', 'x-nullable': true },
          'SEGMENT1' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT2' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT3' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT4' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT5' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT6' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT7' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT8' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT9' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT10' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT11' => { type: 'string', example: '22/04/2009 00:00', 'x-nullable': true },
          'SEGMENT12' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT13' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT14' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT15' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT16' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT17' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT18' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT19' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT20' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT21' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT22' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT23' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT24' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT25' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT26' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT27' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT28' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT29' => { type: 'string', example: nil, 'x-nullable': true },
          'SEGMENT30' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE_CATEGORY' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE1' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE2' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE3' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE4' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE5' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE6' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE7' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE8' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE9' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE10' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE11' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE12' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE13' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE14' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE15' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE16' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE17' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE18' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE19' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE20' => { type: 'string', example: nil, 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2009-04-27T11:55:02.000Z', 'x-nullable': true }
        }
      },
      sit_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'sit_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/sit_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/sit_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/sit_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/sit_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/sit_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/sit_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      sit_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'sit_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/sit_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/sit_record_attributes' }
            }
          }
        }
      }
    }
  end
end
