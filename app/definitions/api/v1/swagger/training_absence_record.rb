class Api::V1::Swagger::TrainingAbsenceRecord
  def self.definitions
    {
      training_absence_record_attributes: {
        type: 'object',
        properties: {
          'Person ID' => { type: 'string', example: '1234567', 'x-nullable': true },
          'Absence Attendance ID' => { type: 'string', example: '43247770', 'x-nullable': true },
          'Absence Type' => { type: 'string', example: 'MEL - Module 4 - Safeguarding Family - ALL CLINICAL STAFF', 'x-nullable': true },
          'Absence Reason' => { type: 'string', example: 'Training Leave', 'x-nullable': true },
          'Status' => { type: 'string', example: 'Withdrawn', 'x-nullable': true },
          'Notification Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Projected Start Date' => { type: 'date', example: '2013-09-18', 'x-nullable': true },
          'Projected Start Time' => { type: 'string', example: '09:15', 'x-nullable': true },
          'Projected End Date' => { type: 'date', example: '2013-09-18', 'x-nullable': true },
          'Projected End Time' => { type: 'string', example: '15:00', 'x-nullable': true },
          'Actual Start Date' => { type: 'date', example: '2013-09-18', 'x-nullable': true },
          'Actual Start Time' => { type: 'string', example: '09:15', 'x-nullable': true },
          'Actual End Date' => { type: 'date', example: '2013-09-18', 'x-nullable': true },
          'Actual End Time' => { type: 'string', example: '15:00', 'x-nullable': true },
          'Sickness Start Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Sickness End Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Absence Duration Days' => { type: 'string', example: nil, 'x-nullable': true },
          'Absence Duration Hours' => { type: 'string', example: nil, 'x-nullable': true },
          'Absence Units' => { type: 'string', example: nil, 'x-nullable': true },
          'Hours Lost' => { type: 'string', example: nil, 'x-nullable': true },
          'Sessions Lost' => { type: 'string', example: nil, 'x-nullable': true },
          'Work Related' => { type: 'string', example: nil, 'x-nullable': true },
          'Third Party' => { type: 'string', example: nil, 'x-nullable': true },
          'Disability Related' => { type: 'string', example: nil, 'x-nullable': true },
          'Violence & Aggression Related' => { type: 'string', example: nil, 'x-nullable': true },
          'Notifiable Disease' => { type: 'string', example: nil, 'x-nullable': true },
          'Return To Work Discussion Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Occupational Health Referral Date' => { type: 'string', example: nil, 'x-nullable': true },
          'Last Update Date' => { type: 'date-time', example: '2013-07-25T10:00:52.000Z', 'x-nullable': true }
        }
      },
      training_absence_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'training_absence_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/training_absence_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/training_absence_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/training_absence_records?page[number]=1&page[size]=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/training_absence_records?page[number]=1&page[size]=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/training_absence_records?page[number]=2&page[size]=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/training_absence_records?page[number]=5&page[size]=5' }
            }
          }
        }
      },
      training_absence_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'training_absence_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/training_absence_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/training_absence_record_attributes' }
            }
          }
        }
      }
    }
  end
end
