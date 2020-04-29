class Api::V1::Swagger::AbsenceRecord
  def self.definitions
    {
      absence_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: 'A48180', 'x-nullable': true },
          'Absence Attendance ID' => { type: 'string', example: '112119701A', 'x-nullable': true },
          'Absence Type' => { type: 'string', example: 'Special Increasing Bal', 'x-nullable': true },
          'Absence Reason' => { type: 'string', example: "Carer's Leave", 'x-nullable': true },
          'Status' => { type: 'string', example: nil, 'x-nullable': true },
          'Notification Date' => { type: 'date', example: '2019-1-2', 'x-nullable': true },
          'Projected Start Date' => { type: 'date', example: '2018-12-6', 'x-nullable': true },
          'Projected Start Time' => { type: 'string', example: nil, 'x-nullable': true },
          'Projected End Date' => { type: 'date', example: '2018-12-6', 'x-nullable': true },
          'Projected End Time' => { type: 'string', example: nil, 'x-nullable': true },
          'Actual Start Date' => { type: 'date', example: '2018-12-6', 'x-nullable': true },
          'Actual Start Time' => { type: 'string', example: nil, 'x-nullable': true },
          'Actual End Date' => { type: 'date', example: '2018-12-6', 'x-nullable': true },
          'Actual End Time' => { type: 'string', example: nil, 'x-nullable': true },
          'Sickness Start Date' => { type: 'date', example: '2018-12-6', 'x-nullable': true },
          'Sickness Date End' => { type: 'date', example: '2018-12-6', 'x-nullable': true },
          'Absence Duration Days' => { type: 'string', example: '1', 'x-nullable': true },
          'Absence Duration Hours' => { type: 'string', example: nil, 'x-nullable': true },
          'Absence Units' => { type: 'string', example: 'D', 'x-nullable': true },
          'Hours Lost' => { type: 'string', example: '7.5', 'x-nullable': true },
          'Sessions Lost' => { type: 'string', example: '1', 'x-nullable': true },
          'Work Related' => { type: 'string', example: 'No', 'x-nullable': true },
          'Third Party' => { type: 'string', example: nil, 'x-nullable': true },
          'Disability Related' => { type: 'string', example: nil, 'x-nullable': true },
          'Violence Aggression Related' => { type: 'string', example: nil, 'x-nullable': true },
          'Notifiable Disease' => { type: 'string', example: nil, 'x-nullable': true },
          'Return To Work Discussion Date' => { type: 'date', example: '2018-12-6', 'x-nullable': true },
          'Occupational Health Referral Date' => { type: 'date', example: '2018-12-6', 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2020-04-07T14:53:54.000Z', 'x-nullable': true },
          'Surgery Related' => { type: 'string', example: nil, 'x-nullable': true },
          'DH Monitoring' => { type: 'string', example: nil, 'x-nullable': true },
          'Sickness Reason' => { type: 'string', example: nil, 'x-nullable': true },
          '3rd Party System Reference' => { type: 'string', example: '726999', 'x-nullable': true }
        }
      },
      absence_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'absence_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/absence_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/absence_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/absence_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/absence_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/absence_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/absence_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      absence_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'absence_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/absence_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/absence_record_attributes' }
            }
          }
        }
      }
    }
  end
end
