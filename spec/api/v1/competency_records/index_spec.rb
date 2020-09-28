require 'swagger_helper'

describe 'Api::V1::CompetencyRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let!(:competency_record) { create(:competency_record) }
  let!(:competency_record2) { create(:competency_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/competency_records' do
    get 'competency records' do
      tags 'CompetencyRecord'
      security [{ Token: {} }]
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

      context 'with a token and at least 1 confirmed user on the system' do
        let(:token) { create(:token, permissions: [permission]) }
        let(:permission) do
          build(
            :permission,
            resource: resource,
            action: action,
            columns: columns
          )
        end
        let!(:confirmed_user) { create(:confirmed_user) }
        let(:columns) { ETL::Headers::CompetencyRecord.api_headers }
        let(:Authorization) { "Bearer #{token.token}" }

        context 'with a permission with the wrong resource' do
          let(:resource) { 'AbsenceRecord' }
          let(:action) { 'index' }
          let(:columns) { ETL::Headers::AbsenceRecord.api_headers }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the wrong action' do
          let(:resource) { 'CompetencyRecord' }
          let(:action) { 'show' }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the right resource and action' do
          let(:resource) { 'CompetencyRecord' }
          let(:action) { 'index' }

          context 'when there are no confirmed users' do
            let!(:confirmed_user) { nil }

            response '403', 'Error: Forbidden' do
              schema '$ref' => '#/definitions/error_403'

              run_test!
            end
          end

          context 'with a subset of columns' do
            let(:columns) { ETL::Headers::CompetencyRecord.api_headers[0..4] }

            response '200', 'successful' do
              schema '$ref' => '#/definitions/competency_records_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data.count).to eq(2)
                  expect(response_data.first['attributes'].map(&:first)).to match_array(columns)
                  database_record = CompetencyRecord.find(response_data.first['id'])
                  response_data.first['attributes'].each do |key, value|
                    expect(database_record.send(key).to_s).to eq(value.to_s)
                  end
                end
              end
            end
          end

          context 'with all columns' do
            response '200', 'successful' do
              schema '$ref' => '#/definitions/competency_records_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data.count).to eq(2)
                  database_record = CompetencyRecord.find(response_data.first['id'])
                  response_data.first['attributes'].each do |key, value|
                    if database_record.send(key).is_a?(Time)
                      expect(database_record.send(key).strftime('%Y-%m-%dT%H:%M:%S.000Z')).to eq(value.to_s)
                    else
                      expect(database_record.send(key).to_s).to eq(value.to_s)
                    end
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
end
