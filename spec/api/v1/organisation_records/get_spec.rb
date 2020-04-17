require 'swagger_helper'

describe 'Api::V1::OrganisationRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:organisation_record) { create(:organisation_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/organisation_records/{id}' do
    get 'organisation record' do
      tags 'OrganisationRecord'
      # security [{ apiToken: [] }, { apiEmail: [] }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { organisation_record.id }

      context 'when a normal user' do
        # let('X-API-TOKEN') { normal_user.authentication_token }
        # let('X-API-EMAIL') { normal_user.email }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/organisation_record_response'

          describe 'attributes match database values' do
            run_test! do
              response_data['attributes'].each do |key, value|
                expect(organisation_record.send(key)).to eq(value)
              end
            end
          end
        end
      end
    end
  end
end
