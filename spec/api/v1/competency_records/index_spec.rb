require 'swagger_helper'

describe 'Api::V1::CompetencyRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let!(:competency_record) { create(:competency_record) }
  let!(:competency_record2) { create(:competency_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/competency_records' do
    get 'competency records' do
      tags 'CompetencyRecord'
      security [{ JWT: {} }]
      produces 'application/vnd.api+json'
      parameter name: 'page[size]', in: :query, type: :integer, required: false
      parameter name: 'page[number]', in: :query, type: :integer, required: false

      let!(:'page[size]') { 2 }
      let!(:'page[number]') { 1 }

      context 'when a normal user' do
        let(:Authorization) { 'Bearer dummy_json_web_token' }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/competency_records_response'

          describe 'attributes match database values' do
            run_test! do
              expect(response_data.count).to eq(2)
              database_record = CompetencyRecord.find(response_data.first['id'])
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
