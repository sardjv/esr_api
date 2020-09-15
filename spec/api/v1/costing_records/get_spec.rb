require 'swagger_helper'

describe 'Api::V1::CostingRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:costing_record) { create(:costing_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/costing_records/{id}' do
    get 'costing record' do
      tags 'CostingRecord'
      security [{ JWT: {} }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { costing_record.id }

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

        response '200', 'successful' do
          schema '$ref' => '#/definitions/costing_record_response'

          describe 'attributes match database values' do
            run_test! do
              response_data['attributes'].each do |key, value|
                expect(costing_record.send(key).to_s).to eq(value.to_s)
              end
            end
          end
        end
      end
    end
  end
end
