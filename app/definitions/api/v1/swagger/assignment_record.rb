class Api::V1::Swagger::AssignmentRecord
  def self.definitions
    {
      assignment_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Assignment ID' => { type: 'string', example: '936458', 'x-nullable': true },
          'Effective Start Date' => { type: 'date', example: '2011-06-01', 'x-nullable': true },
          'Effective End Date' => { type: 'date', example: '4712-12-31', 'x-nullable': true },
          'Earliest Assignment Start Date' => { type: 'date', example: '2006-07-27', 'x-nullable': true },
          'Assignment Type' => { type: 'string', example: 'E', 'x-nullable': true },
          'Assignment Number' => { type: 'string', example: '10602402', 'x-nullable': true },
          'System Assignment Status' => { type: 'string', example: 'ACTIVE_ASSIGN', 'x-nullable': true },
          'User Assignment Status' => { type: 'string', example: 'Active Assignment', 'x-nullable': true },
          'Employee Status Flag' => { type: 'string', example: 'X', 'x-nullable': true },
          'Payroll Name' => { type: 'string', example: '123 Monthly', 'x-nullable': true },
          'Payroll Period Type' => { type: 'string', example: 'Calendar', 'x-nullable': true },
          'Assignment Location ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Supervisor Flag' => { type: 'string', example: nil, 'x-nullable': true },
          'Supervisor Person ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Supervisor Assignment ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Supervisor Assignment Number' => { type: 'string', example: nil, 'x-nullable': true },
          'Department Manager Person ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Employee Category' => { type: 'string', example: nil, 'x-nullable': true },
          'Assignment Category' => { type: 'string', example: nil, 'x-nullable': true },
          'Primary Assignment' => { type: 'string', example: nil, 'x-nullable': true },
          'Normal Hours / Sessions' => { type: 'string', example: nil, 'x-nullable': true },
          'Frequency' => { type: 'string', example: nil, 'x-nullable': true },
          'Grade Contract Hours' => { type: 'string', example: nil, 'x-nullable': true },
          'FTE' => { type: 'string', example: nil, 'x-nullable': true },
          'Flexible Working Pattern' => { type: 'string', example: nil, 'x-nullable': true },
          'Organisation ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Position ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Position Name' => { type: 'string', example: nil, 'x-nullable': true },
          'Grade' => { type: 'string', example: nil, 'x-nullable': true },
          'Grade Step' => { type: 'string', example: nil, 'x-nullable': true },
          'Start Date in Grade' => { type: 'string', example: nil, 'x-nullable': true },
          'Annual Salary Value' => { type: 'string', example: nil, 'x-nullable': true },
          'Job Name' => { type: 'string', example: nil, 'x-nullable': true },
          'People Group' => { type: 'string', example: nil, 'x-nullable': true },
          'T&A Flag' => { type: 'string', example: nil, 'x-nullable': true },
          'Assignment Night Worker Attribute' => { type: 'string', example: nil, 'x-nullable': true },
          'Projected Hire Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Vacancy ID' => { type: 'string', example: nil, 'x-nullable': true },
          'Contract End Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Increment Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Maximum Part Time Flag' => { type: 'string', example: nil, 'x-nullable': true },
          'AFC Flag' => { type: 'string', example: nil, 'x-nullable': true },
          'Last Update Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Last Working Day' => { type: 'string', example: nil, 'x-nullable': true },
          'e-KSF Spinal Point' => { type: 'string', example: nil, 'x-nullable': true },
          'Manager Flag' => { type: 'string', example: nil, 'x-nullable': true },
          'Assignment End Date' => { type: 'string', example: nil, 'x-nullable': true }
        }
      },
      assignment_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'assignment_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/assignment_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/assignment_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/assignment_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/assignment_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/assignment_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/assignment_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      assignment_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'assignment_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/assignment_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/assignment_record_attributes' }
            }
          }
        }
      }
    }
  end
end
