require 'swagger_helper'

describe 'Api::V1::OrganisationRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:organisation_record) { create(:organisation_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/organisation_records/{id}' do
    get 'organisation record' do
      tags 'OrganisationRecord'
      security [{ JWT: {} }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { organisation_record.id }

      context 'when not authenticated' do
        let(:Authorization) { nil }

        response '401', 'Error: Unauthorized' do
          schema '$ref' => '#/definitions/error_401'

          run_test!
        end
      end

      context 'when an admin' do
        include_context 'Mock Token'
        let(:Authorization) { 'Bearer dummy_json_web_token' }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/organisation_record_response'

          describe 'attributes match database values' do
            run_test! do
              response_data['attributes'].each do |key, value|
                expect(organisation_record.send(key).to_s).to eq(value.to_s)
              end
            end
          end
        end
      end
    end
  end
end
