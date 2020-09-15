require 'swagger_helper'

describe 'Api::V1::SitRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let!(:sit_record) { create(:sit_record) }
  let!(:sit_record2) { create(:sit_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/sit_records' do
    get 'sit records' do
      tags 'SitRecord'
      security [{ JWT: {} }]
      produces 'application/vnd.api+json'
      parameter name: 'page[size]', in: :query, type: :integer, required: false
      parameter name: 'page[number]', in: :query, type: :integer, required: false

      let!(:'page[size]') { 2 }
      let!(:'page[number]') { 1 }

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
            schema '$ref' => '#/definitions/sit_records_response'

            describe 'attributes match database values' do
              run_test! do
                expect(response_data.count).to eq(2)
                database_record = SitRecord.find(response_data.first['id'])
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
end
