class Api::V1::Swagger::CompetenceDefinitionRecord
  def self.definitions
    {
      competence_definition_record_attributes: {
        type: 'object',
        properties: {
          'Competence ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Competence Name' => { type: 'string', example: '277|CNST', 'x-nullable': true },
          'Description' => { type: 'string', example: 'Prevention', 'x-nullable': true },
          'Date From' => { type: 'date', example: '2020-06-02', 'x-nullable': true },
          'Date To' => { type: 'date', example: nil, 'x-nullable': true },
          'Behavioural Indicator' => { type: 'string', example: nil, 'x-nullable': true },
          'Certification Required' => { type: 'string', example: 'No', 'x-nullable': true },
          'Rating Scale ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Evaluation Method' => { type: 'string', example: 'Course Attendance', 'x-nullable': true },
          'Renewal Period Freq' => { type: 'string', example: '1', 'x-nullable': true },
          'Renewal Period Units' => { type: 'string', example: 'Year', 'x-nullable': true },
          'Competence Cluster' => { type: 'string', example: nil, 'x-nullable': true },
          'Competence Alias' => { type: 'string', example: nil, 'x-nullable': true },
          'VPD Code' => { type: 'string', example: '277', 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2011-08-03T16:13:10.000Z', 'x-nullable': true },
        }
      },
      competence_definition_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'competence_definition_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competence_definition_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/competence_definition_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competence_definition_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competence_definition_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competence_definition_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/competence_definition_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      competence_definition_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'competence_definition_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/competence_definition_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/competence_definition_record_attributes' }
            }
          }
        }
      }
    }
  end
end
