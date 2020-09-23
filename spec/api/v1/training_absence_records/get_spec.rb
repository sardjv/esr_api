require 'swagger_helper'

describe 'Api::V1::TrainingAbsenceRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:training_absence_record) { create(:training_absence_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/training_absence_records/{id}' do
    get 'training absence record' do
      tags 'TrainingAbsenceRecord'
      security [{ Token: {} }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { training_absence_record.id }

      context 'when not authenticated' do
        let(:Authorization) { nil }

        response '401', 'Error: Unauthorized' do
          schema '$ref' => '#/definitions/error_401'

          run_test!
        end
      end

      context 'with a token and at least 1 confirmed user on the system' do
        let(:token) { create(:token) }
        let!(:confirmed_user) { create(:confirmed_user) }
        let(:columns) { ETL::Headers::TrainingAbsenceRecord.api_headers.join(',') }
        let!(:permission) do
          create(
            :permission,
            subject: token,
            resource: resource,
            action: action,
            columns: columns
          )
        end
        let(:Authorization) { "Bearer #{token.token}" }

        context 'with no permissions' do
          let!(:permission) { nil }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the wrong resource' do
          let(:resource) { 'AbsenceRecord' }
          let(:action) { 'show' }
          let(:columns) { ETL::Headers::AbsenceRecord.api_headers.join(',') }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the wrong action' do
          let(:resource) { 'TrainingAbsenceRecord' }
          let(:action) { 'index' }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the right resource and action' do
          let(:resource) { 'TrainingAbsenceRecord' }
          let(:action) { 'show' }

          context 'when there are no confirmed users' do
            let!(:confirmed_user) { nil }

            response '403', 'Error: Forbidden' do
              schema '$ref' => '#/definitions/error_403'

              run_test!
            end
          end

          context 'with a subset of columns' do
            let(:columns) { ETL::Headers::TrainingAbsenceRecord.api_headers[0..4].join(',') }

            response '200', 'successful' do
              schema '$ref' => '#/definitions/training_absence_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns.split(','))
                  response_data['attributes'].each do |key, value|
                    expect(training_absence_record.send(key).to_s).to eq(value.to_s)
                  end
                end
              end
            end
          end

          context 'with all columns' do
            response '200', 'successful' do
              schema '$ref' => '#/definitions/training_absence_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns.split(','))
                  response_data['attributes'].each do |key, value|
                    if training_absence_record.send(key).is_a?(Time)
                      expect(training_absence_record.send(key).strftime('%Y-%m-%dT%H:%M:%S.000Z')).to eq(value.to_s)
                    else
                      expect(training_absence_record.send(key).to_s).to eq(value.to_s)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
