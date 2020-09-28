require 'swagger_helper'

describe 'Api::V1::PersonEitRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:person_eit_record) { create(:person_eit_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/person_eit_records/{id}' do
    get 'person eit record' do
      tags 'PersonEitRecord'
      security [{ Token: {} }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { person_eit_record.id }

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
        let(:columns) { ETL::Headers::PersonEitRecord.api_headers }
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
          let(:resource) { 'PersonEitRecord' }
          let(:action) { 'index' }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the right resource and action' do
          let(:resource) { 'PersonEitRecord' }
          let(:action) { 'show' }

          context 'when there are no confirmed users' do
            let!(:confirmed_user) { nil }

            response '403', 'Error: Forbidden' do
              schema '$ref' => '#/definitions/error_403'

              run_test!
            end
          end

          context 'with a subset of columns' do
            let(:columns) { ETL::Headers::PersonEitRecord.api_headers[0..4] }

            response '200', 'successful' do
              schema '$ref' => '#/definitions/person_eit_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns)
                  response_data['attributes'].each do |key, value|
                    expect(person_eit_record.send(key).to_s).to eq(value.to_s)
                  end
                end
              end
            end
          end

          context 'with all columns' do
            response '200', 'successful' do
              schema '$ref' => '#/definitions/person_eit_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns)
                  response_data['attributes'].each do |key, value|
                    if person_eit_record.send(key).is_a?(Time)
                      expect(person_eit_record.send(key).strftime('%Y-%m-%dT%H:%M:%S.000Z')).to eq(value.to_s)
                    else
                      expect(person_eit_record.send(key).to_s).to eq(value.to_s)
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
