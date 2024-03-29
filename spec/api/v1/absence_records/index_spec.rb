require 'swagger_helper'

describe 'Api::V1::AbsenceRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let!(:absence_record) { create(:absence_record) }
  let!(:absence_record2) { create(:absence_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/absence_records' do
    get 'absence records' do
      tags 'AbsenceRecord'
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

          run_test! do
            refute(absence_record.events.exists?(key: 'absence_record.index'))
          end
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
        let(:columns) { ETL::Headers::AbsenceRecord.api_headers }
        let(:Authorization) { "Bearer #{token.token}" }

        context 'with a permission with the wrong resource' do
          let(:resource) { 'SitRecord' }
          let(:action) { 'index' }
          let(:columns) { ETL::Headers::SitRecord.api_headers }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test! do
              refute(Event.exists?(key: 'absence_record.index'))
            end
          end
        end

        context 'with a permission with the wrong action' do
          let(:resource) { 'AbsenceRecord' }
          let(:action) { 'show' }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test! do
              refute(Event.exists?(key: 'absence_record.index'))
            end
          end
        end

        context 'with a permission with the right resource and action' do
          let(:resource) { 'AbsenceRecord' }
          let(:action) { 'index' }

          context 'when there are no confirmed users' do
            before { User.update_all(confirmed_at: nil) }

            response '403', 'Error: Forbidden' do
              schema '$ref' => '#/definitions/error_403'

              run_test! do
                refute(Event.exists?(key: 'absence_record.index'))
              end
            end
          end

          context 'when there are no absence records' do
            let!(:absence_record) { nil }
            let!(:absence_record2) { nil }

            response '404', 'Error: Record not found' do
              schema '$ref' => '#/definitions/error_404'

              run_test! do
                refute(Event.exists?(key: 'absence_record.show'))
              end
            end
          end

          context 'with a subset of columns' do
            let(:columns) { ETL::Headers::AbsenceRecord.api_headers[0..4] }

            response '200', 'successful' do
              schema '$ref' => '#/definitions/absence_records_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data.count).to eq(2)
                  expect(response_data.first['attributes'].map(&:first)).to match_array(columns)
                  database_record = AbsenceRecord.find(response_data.first['id'])
                  response_data.first['attributes'].each do |key, value|
                    expect(database_record.send(key).to_s).to eq(value.to_s)
                  end

                  assert(Event.exists?(key: 'absence_record.index'))
                end
              end
            end
          end

          context 'with all columns' do
            response '200', 'successful' do
              schema '$ref' => '#/definitions/absence_records_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data.count).to eq(2)
                  database_record = AbsenceRecord.find(response_data.first['id'])
                  response_data.first['attributes'].each do |key, value|
                    if database_record.send(key).is_a?(Time)
                      expect(database_record.send(key).iso8601(3)).to eq(value.to_s)
                    else
                      expect(database_record.send(key).to_s).to eq(value.to_s)
                    end
                  end

                  assert(Event.exists?(key: 'absence_record.index'))
                end
              end

              context 'with 1 result per page' do
                let!(:'page[size]') { 1 }
                let!(:'page[number]') { 2 }

                run_test! do
                  expect(response_data.length).to eq(1)

                  assert(Event.exists?(key: 'absence_record.index'))
                end
              end
            end
          end
        end
      end
    end
  end
end
