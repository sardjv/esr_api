require 'swagger_helper'

describe 'Api::V1::CompetencyRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:competency_record) { create(:competency_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/competency_records/{id}' do
    get 'competency record' do
      tags 'CompetencyRecord'
      security [{ Token: {} }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { competency_record.id }

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
          let(:action) { 'show' }
          let(:columns) { ETL::Headers::AbsenceRecord.api_headers }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the wrong action' do
          let(:resource) { 'CompetencyRecord' }
          let(:action) { 'index' }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the right resource and action' do
          let(:resource) { 'CompetencyRecord' }
          let(:action) { 'show' }

          context 'when there are no confirmed users' do
            before { User.update_all(confirmed_at: nil) }

            response '403', 'Error: Forbidden' do
              schema '$ref' => '#/definitions/error_403'

              run_test!
            end
          end

          context 'with a subset of columns' do
            let(:columns) { ETL::Headers::CompetencyRecord.api_headers[0..4] }

            response '200', 'successful' do
              schema '$ref' => '#/definitions/competency_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns)
                  response_data['attributes'].each do |key, value|
                    expect(competency_record.send(key).to_s).to eq(value.to_s)
                  end
                end
              end
            end
          end

          context 'with all columns' do
            response '200', 'successful' do
              schema '$ref' => '#/definitions/competency_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns)
                  response_data['attributes'].each do |key, value|
                    if competency_record.send(key).is_a?(Time)
                      expect(competency_record.send(key).iso8601(3)).to eq(value.to_s)
                    else
                      expect(competency_record.send(key).to_s).to eq(value.to_s)
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
