require 'swagger_helper'

describe 'Api::V1::AbsenceRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:absence_record) { create(:absence_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/absence_records/{id}' do
    get 'absence record' do
      tags 'AbsenceRecord'
      security [{ Token: {} }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { absence_record.id }

      context 'when not authenticated' do
        let(:Authorization) { nil }

        response '401', 'Error: Unauthorized' do
          schema '$ref' => '#/definitions/error_401'

          run_test! do
            refute(absence_record.events.exists?(key: 'absence_record.show'))
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
          let(:action) { 'show' }
          let(:columns) { ETL::Headers::SitRecord.api_headers }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test! do
              refute(absence_record.events.exists?(key: 'absence_record.show'))
            end
          end
        end

        context 'with a permission with the wrong action' do
          let(:resource) { 'AbsenceRecord' }
          let(:action) { 'index' }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test! do
              refute(absence_record.events.exists?(key: 'absence_record.show'))
            end
          end
        end

        context 'with a permission with the right resource and action' do
          let(:resource) { 'AbsenceRecord' }
          let(:action) { 'show' }

          context 'when there are no confirmed users' do
            before { User.update_all(confirmed_at: nil) }

            response '403', 'Error: Forbidden' do
              schema '$ref' => '#/definitions/error_403'

              run_test! do
                refute(absence_record.events.exists?(key: 'absence_record.show'))
              end
            end
          end

          context 'when there is no absence record' do
            let(:id) { '123' }

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
              schema '$ref' => '#/definitions/absence_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns)
                  response_data['attributes'].each do |key, value|
                    expect(absence_record.send(key).to_s).to eq(value.to_s)
                  end

                  assert(absence_record.events.exists?(key: 'absence_record.show'))
                end
              end
            end
          end

          context 'with all columns' do
            response '200', 'successful' do
              schema '$ref' => '#/definitions/absence_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns)
                  response_data['attributes'].each do |key, value|
                    if absence_record.send(key).is_a?(Time)
                      expect(absence_record.send(key).iso8601(3)).to eq(value.to_s)
                    else
                      expect(absence_record.send(key).to_s).to eq(value.to_s)
                    end
                  end

                  assert(absence_record.events.exists?(key: 'absence_record.show'))
                end
              end
            end
          end
        end
      end
    end
  end
end
