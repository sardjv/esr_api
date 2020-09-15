require 'swagger_helper'

describe 'Api::V1::LocationRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:location_record) { create(:location_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/location_records/{id}' do
    get 'person record' do
      tags 'LocationRecord'
      security [{ Token: {} }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { location_record.id }

      context 'when not authenticated' do
        let(:Authorization) { nil }

        response '401', 'Error: Unauthorized' do
          schema '$ref' => '#/definitions/error_401'

          run_test!
        end
      end

      context 'when an admin' do
        let(:token) { create(:token) }
        let(:Authorization) { "Bearer #{token.token}" }

        context 'when there are no confirmed users' do
          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a confirmed user' do
          let!(:confirmed_user) { create(:confirmed_user) }

          response '200', 'successful' do
            schema '$ref' => '#/definitions/location_record_response'

            describe 'attributes match database values' do
              run_test! do
                response_data['attributes'].each do |key, value|
                  expect(location_record.send(key).to_s).to eq(value.to_s)
                end
              end
            end
          end
        end
      end
    end
  end
end
