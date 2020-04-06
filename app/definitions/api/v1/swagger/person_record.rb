class Api::V1::Swagger::PersonRecord
  def self.definitions
    {
      person_record_attributes: {
        type: 'object',
        properties: {
          'Record Type' => { type: 'string', example: 'PRA' },
          'PersonID' => { type: 'string', example: '481801' },
          'Effective StartDate' => { type: 'string', example: '20170501' },
          'Effective EndDate' => { type: 'string', example: nil },
          'Employee Number' => { type: 'string', example: '10259801' },
          'Title' => { type: 'string', example: 'Mr.' },
          'LastName' => { type: 'string', example: 'sname' },
          'FirstName' => { type: 'string', example: 'fname' },
          'MiddleNames' => { type: 'string', example: 'fname' },
          'MaidenName' => { type: 'string', example: 'sname' },
          'Previous LastName' => { type: 'string', example: 'sname' },
          'Gender' => { type: 'string', example: 'Female' },
          'Date of Birth' => { type: 'string', example: '19860801' },
          'NationalInsurance Number' => { type: 'string', example: 'AB012201B' },
          'NHS UniqueID' => { type: 'string', example: '289601' },
          'HireDate' => { type: 'string', example: '20040601' },
          'ActualTermination Date' => { type: 'string', example: nil },
          'Termination Reason' => { type: 'string', example: nil },
          'Employee StatusFlag' => { type: 'string', example: 'E' },
          'WTR Opt Out' => { type: 'string', example: nil },
          'WTR Opt Out Date' => { type: 'string', example: nil },
          'Ethnic Origin' => { type: 'string', example: 'British' },
          'Country of Birth' => { type: 'string', example: 'United Kingdom' },
          'Previous Employer' => { type: 'string', example: 'OXLEAS NHS TRUST' },
          'Previous EmployerType' => { type: 'string', example: 'Unknown' },
          'CSD 3 Months' => { type: 'string', example: '20030701' },
          'CSD 12 Months' => { type: 'string', example: '20040401' },
          'NHS CRS UUID' => { type: 'string', example: nil },
          'System Person Type' => { type: 'string', example: 'EMP' },
          'User Person Type' => { type: 'string', example: 'Employee.Ex-Applicant' },
          'Office e-mail address' => { type: 'string', example: 'john.smith@example.com' },
          'NHS StartDate' => { type: 'string', example: '20030701' },
          'Last UpdateDate' => { type: 'string', example: '20170501' },
          'Disability Flag' => { type: 'string', example: 'N' },
          'Ins_Upd_TimeStamp' => { type: 'string', example: nil }
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
              next: { type: 'string', example: 'https://esr.sardjv.co.uk/api/v1/person_records?page=3&per_page=5' },
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
