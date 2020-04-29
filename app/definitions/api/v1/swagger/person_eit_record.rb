class Api::V1::Swagger::PersonEitRecord
  def self.definitions
    {
      person_eit_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Person Extra Information ID' => { type: 'string', example: '957384', 'x-nullable': true },
          'Information Type' => { type: 'string', example: ' NHS Regs and Memships', 'x-nullable': true },
          'PEI_INFORMATION_CATEGORY' => { type: 'string', example: 'NHS Regs and Memships', 'x-nullable': true },
          'PEI_INFORMATION1' => { type: 'string', example: 'Nursing and Midwifery Council', 'x-nullable': true },
          'PEI_INFORMATION2' => { type: 'string', example: ' 94I0864E', 'x-nullable': true },
          'PEI_INFORMATION3' => { type: 'string', example: ' 31/08/2012 00:00:00', 'x-nullable': true },
          'PEI_INFORMATION4' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION5' => { type: 'string', example: ' 31/08/2013 00:00:00', 'x-nullable': true },
          'PEI_INFORMATION6' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION7' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION8' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION9' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION10' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION11' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION12' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION13' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION14' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION15' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION16' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION17' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION18' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION19' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION20' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION21' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION22' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION23' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION24' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION25' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION26' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION27' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION28' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION29' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_INFORMATION30' => { type: 'string', example: nil, 'x-nullable': true },
          'ATTRIBUTE_CATEGORY' => { type: 'string', example: ' Nursing and Midwifery Council', 'x-nullable': true },
          'PEI_ATTRIBUTE1' => { type: 'string', example: ' Sub-Part 1 RNLD (Learning Disabilities)', 'x-nullable': true },
          'PEI_ATTRIBUTE2' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE3' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE4' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE5' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE6' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE7' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE8' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE9' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE10' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE11' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE12' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE13' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE14' => { type: 'string', example: 'No', 'x-nullable': true },
          'PEI_ATTRIBUTE15' => { type: 'string', example: 'No', 'x-nullable': true },
          'PEI_ATTRIBUTE16' => { type: 'string', example: 'No', 'x-nullable': true },
          'PEI_ATTRIBUTE17' => { type: 'string', example: 'No', 'x-nullable': true },
          'PEI_ATTRIBUTE18' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE19' => { type: 'string', example: nil, 'x-nullable': true },
          'PEI_ATTRIBUTE20' => { type: 'string', example: nil, 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2011-07-19T23:20:41.000Z', 'x-nullable': true }
        }
      },
      person_eit_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'person_eit_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/person_eit_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_eit_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      person_eit_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'person_eit_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/person_eit_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/person_eit_record_attributes' }
            }
          }
        }
      }
    }
  end
end
