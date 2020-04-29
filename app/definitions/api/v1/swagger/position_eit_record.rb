class Api::V1::Swagger::PositionEitRecord
  def self.definitions
    {
      position_eit_record_attributes: {
        type: 'object',
        properties: {
          'Position ID' => { type: 'string', example: '5992270', 'x-nullable': true },
          'Position Extra Information ID' => { type: 'string', example: '9456120', 'x-nullable': true },
          'Information Type' => { type: 'string', example: 'NHS Med and Dental Post Detail', 'x-nullable': true },
          'POEI_INFORMATION_CATEGORY' => { type: 'string', example: 'NHS Med and Dental Post Detail', 'x-nullable': true },
          'POEI_INFORMATION1' => { type: 'string', example: 'NHS/N075/040/STRH/001', 'x-nullable': true },
          'POEI_INFORMATION2' => { type: 'string', example: '1A', 'x-nullable': true },
          'POEI_INFORMATION3' => { type: 'string', example: 'Full Shift', 'x-nullable': true },
          'POEI_INFORMATION4' => { type: 'string', example: 'Prospective Cover', 'x-nullable': true },
          'POEI_INFORMATION5' => { type: 'string', example: 'Continuous Hours Duty', 'x-nullable': true },
          'POEI_INFORMATION6' => { type: 'string', example: 'NHS', 'x-nullable': true },
          'POEI_INFORMATION7' => { type: 'string', example: 'L', 'x-nullable': true },
          'POEI_INFORMATION8' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION9' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION10' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION11' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION12' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION13' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION14' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION15' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION16' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION17' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION18' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION19' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION20' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION21' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION22' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION23' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION24' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION25' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION26' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION27' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION28' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION29' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_INFORMATION30' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE_CATEGORY' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE1' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE2' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE3' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE4' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE5' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE6' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE7' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE8' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE9' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE10' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE11' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE12' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE13' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE14' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE15' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE16' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE17' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE18' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE19' => { type: 'string', example: nil, 'x-nullable': true },
          'POEI_ATTRIBUTE20' => { type: 'string', example: nil, 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2013-05-14T10:07:11.000Z', 'x-nullable': true }
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
