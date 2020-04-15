require 'swagger_helper'

describe 'Api::V1::PositionRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let!(:position_record) { create(:position_record) }
  let!(:position_record2) { create(:position_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/position_records' do
    get 'position records' do
      tags 'PositionRecord'
      # security [{ apiToken: [] }, { apiEmail: [] }]
      produces 'application/vnd.api+json'
      parameter name: 'page[size]', in: :query, type: :integer, required: false
      parameter name: 'page[number]', in: :query, type: :integer, required: false

      let!(:'page[size]') { 2 }
      let!(:'page[number]') { 1 }

      context 'when a normal user' do
        # let('X-API-TOKEN') { normal_user.authentication_token }
        # let('X-API-EMAIL') { normal_user.email }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/position_records_response'

          describe 'attributes match database values' do
            run_test! do
              expect(response_data.count).to eq(2)
              database_record = PositionRecord.find(response_data.first['id'])
              response_data.first['attributes'].each do |key, value|
                expect(database_record.send(key).to_s).to eq(value.to_s)
              end
            end
          end

          context 'with 1 result per page' do
            let!(:'page[size]') { 1 }
            let!(:'page[number]') { 2 }

            run_test! do
              expect(response_data.length).to eq(1)
            end
          end
        end
      end
    end
  end
end
