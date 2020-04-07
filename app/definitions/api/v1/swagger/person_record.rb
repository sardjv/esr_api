class Api::V1::Swagger::PersonRecord
  def self.definitions
    {
      person_record_attributes: {
        type: 'object',
        properties: {
          'Record Type' => { type: 'string', example: 'PRA', 'x-nullable': true },
          'PersonID' => { type: 'string', example: 'A48180', 'x-nullable': true },
          'Effective StartDate' => { type: 'date', example: '2017-05-01', 'x-nullable': true },
          'Effective EndDate' => { type: 'date', example: '2020-05-01', 'x-nullable': true },
          'Employee Number' => { type: 'string', example: '102598012', 'x-nullable': true },
          'Title' => { type: 'string', example: 'Mr.', 'x-nullable': true },
          'LastName' => { type: 'string', example: 'sname', 'x-nullable': true },
          'FirstName' => { type: 'string', example: 'fname', 'x-nullable': true },
          'MiddleNames' => { type: 'string', example: 'fname', 'x-nullable': true },
          'MaidenName' => { type: 'string', example: 'sname', 'x-nullable': true },
          'Previous LastName' => { type: 'string', example: 'sname', 'x-nullable': true },
          'Gender' => { type: 'string', example: 'Female', 'x-nullable': true },
          'Date of Birth' => { type: 'date', example: '1986-08-01', 'x-nullable': true },
          'NationalInsurance Number' => { type: 'string', example: 'AB012201B', 'x-nullable': true },
          'NHS UniqueID' => { type: 'string', example: '289601', 'x-nullable': true },
          'HireDate' => { type: 'date', example: '2004-06-01', 'x-nullable': true },
          'ActualTermination Date' => { type: 'date', example: '2020-05-01', 'x-nullable': true },
          'Termination Reason' => { type: 'string', example: nil, 'x-nullable': true },
          'Employee StatusFlag' => { type: 'string', example: 'E', 'x-nullable': true },
          'WTR Opt Out' => { type: 'string', example: nil, 'x-nullable': true },
          'WTR Opt Out Date' => { type: 'date', example: '2020-05-01', 'x-nullable': true },
          'Ethnic Origin' => { type: 'string', example: 'British', 'x-nullable': true },
          'Country of Birth' => { type: 'string', example: 'United Kingdom', 'x-nullable': true },
          'Previous Employer' => { type: 'string', example: 'OXLEAS NHS TRUST', 'x-nullable': true },
          'Previous EmployerType' => { type: 'string', example: 'Unknown', 'x-nullable': true },
          'CSD 3 Months' => { type: 'date', example: '2003-07-01', 'x-nullable': true },
          'CSD 12 Months' => { type: 'date', example: '2004-04-01', 'x-nullable': true },
          'NHS CRS UUID' => { type: 'string', example: nil, 'x-nullable': true },
          'System Person Type' => { type: 'string', example: 'EMP', 'x-nullable': true },
          'User Person Type' => { type: 'string', example: 'Employee.Ex-Applicant', 'x-nullable': true },
          'Office e-mail address' => { type: 'string', example: 'john.smith@example.com', 'x-nullable': true },
          'NHS StartDate' => { type: 'date', example: '2003-07-01', 'x-nullable': true },
          'Last UpdateDate' => { type: 'date', example: '2017-05-01', 'x-nullable': true },
          'Disability Flag' => { type: 'string', example: 'N', 'x-nullable': true },
          'Ins_Upd_TimeStamp' => { type: 'date-time', example: '2020-04-07T14:53:54.000Z', 'x-nullable': true }
        }
      },
      person_records_response: {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string', example: '0' },
                type: { type: 'string', example: 'person_records' },
                link: {
                  type: 'object',
                  properties: {
                    self: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records/0' }
                  }
                },
                attributes: { '$ref' => '#/definitions/person_record_attributes' }
              }
            }
          },
          links: {
            type: 'object',
            properties: {
              first: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=1&per_page=5' },
              prev: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=1&per_page=5' },
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=2&per_page=5' },
              last: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=5&per_page=5' }
            }
          }
        }
      },
      person_record_response: {
        type: 'object',
        properties: {
          data: {
            type: 'object',
            properties: {
              id: { type: 'string', example: '0' },
              type: { type: 'string', example: 'person_records' },
              link: {
                type: 'object',
                properties: {
                  self: { type: 'string', example: 'https://esr_api.sardjv.co.uk/api/v1/person_records/0' }
                }
              },
              attributes: { '$ref' => '#/definitions/person_record_attributes' }
            }
          }
        }
      }
    }
  end
end
