class Api::V1::Swagger::PositionEITRecord
  def self.definitions
    {
      position_eit_record_attributes: {
        type: 'object',
        properties: {

        }
      },
      position_eit_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'position_eit_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_eit_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/position_eit_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_eit_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_eit_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_eit_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/position_eit_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      position_eit_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'position_eit_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/position_eit_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/position_eit_record_attributes' }
            }
          }
        }
      }
    }
  end
end
