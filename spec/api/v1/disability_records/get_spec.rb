require 'swagger_helper'

describe 'Api::V1::DisabilityRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:disability_record) { create(:disability_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/disability_records/{id}' do
    get 'disability record' do
      tags 'DisabilityRecord'
      # security [{ apiToken: [] }, { apiEmail: [] }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { disability_record.id }

      context 'when a normal user' do
        # let('X-API-TOKEN') { normal_user.authentication_token }
        # let('X-API-EMAIL') { normal_user.email }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/disability_record_response'

          describe 'attributes match database values' do
            run_test! do
              response_data['attributes'].each do |key, value|
                expect(disability_record.send(key).to_s).to eq(value.to_s)
              end
            end
          end
        end
      end
    end
  end
end
