require 'swagger_helper'

describe 'Api::V1::SitRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:sit_record) { create(:sit_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/sit_records/{id}' do
    get 'sit record' do
      tags 'SitRecord'
      security [{ Token: {} }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { sit_record.id }

      context 'when not authenticated' do
        let(:Authorization) { nil }

        response '401', 'Error: Unauthorized' do
          schema '$ref' => '#/definitions/error_401'

          run_test!
        end
      end

      context 'with a token' do
        let!(:confirmed_user) { create(:confirmed_user) }
        let(:token) { create(:token) }
        let(:columns) { ETL::Headers::SitRecord.api_headers.join(',') }
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
          let(:resource) { 'SitRecord' }
          let(:action) { 'index' }

          response '403', 'Error: Forbidden' do
            schema '$ref' => '#/definitions/error_403'

            run_test!
          end
        end

        context 'with a permission with the right resource and action' do
          let(:resource) { 'SitRecord' }
          let(:action) { 'show' }

          context 'when there are no confirmed users' do
            let!(:confirmed_user) { nil }

            response '403', 'Error: Forbidden' do
              schema '$ref' => '#/definitions/error_403'

              run_test!
            end
          end

          context 'with a subset of columns' do
            let(:columns) { ETL::Headers::SitRecord.api_headers[0..4].join(',') }

            response '200', 'successful' do
              schema '$ref' => '#/definitions/sit_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns.split(','))
                  response_data['attributes'].each do |key, value|
                    expect(sit_record.send(key).to_s).to eq(value.to_s)
                  end
                end
              end
            end
          end

          context 'with all columns' do
            response '200', 'successful' do
              schema '$ref' => '#/definitions/sit_record_response'

              describe 'attributes match database values' do
                run_test! do
                  expect(response_data['attributes'].map(&:first)).to match_array(columns.split(','))
                  response_data['attributes'].each do |key, value|
                    expect(sit_record.send(key).to_s).to eq(value.to_s)
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
