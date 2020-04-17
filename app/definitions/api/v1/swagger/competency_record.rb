class Api::V1::Swagger::CompetencyRecord
  def self.definitions
    {
      competency_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Competency Element ID' => { type: 'string', example: '10005280', 'x-nullable': true },
          'Competency Type' => { type: 'string', example: 'PERSONAL', 'x-nullable': true },
          'Competency Status' => { type: 'string', example: 'ACHIEVED', 'x-nullable': true },
          'Competency Name' => { type: 'string', example: 'NHS|KSF|Health, Safety and Security C3|Core', 'x-nullable': true },
          'Date From' => { type: 'date', example: '2009-10-27', 'x-nullable': true },
          'Date To' => { type: 'date', example: '2013-07-06', 'x-nullable': true },
          'Proficiency Level' => { type: 'string', example: '1 - Level 1', 'x-nullable': true },
          'VPD Code' => { type: 'string', example: '123', 'x-nullable': true },
          'Certification Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Certification Method' => { type: 'string', example: nil, 'x-nullable': true },
          'Next Certification Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Competence ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Business Group ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Job ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Organisation ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Position ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Proficiency Level ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Proficiency High Level ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Essential Flag' => { type: 'string', example: nil, 'x-nullable': true },
          'Records Type' => { type: 'string', example: nil, 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2009-11-01T07:03:36.000Z', 'x-nullable': true }
        }
      },
      competency_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'competency_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competency_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/competency_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competency_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competency_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competency_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competency_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      competency_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'competency_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/competency_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/competency_record_attributes' }
            }
          }
        }
      }
    }
  end
end
