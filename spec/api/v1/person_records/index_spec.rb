require 'swagger_helper'

describe 'Api::V1::PersonRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let!(:person_record) { create(:person_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/person_records' do
    get 'person records' do
      tags 'PersonRecord'
      # security [{ apiToken: [] }, { apiEmail: [] }]
      produces 'application/vnd.api+json'
      parameter name: 'page', in: :query, type: :string, required: false
      parameter name: 'per_page', in: :query, type: :string, required: false

      context 'when a normal user' do
        # let('X-API-TOKEN') { normal_user.authentication_token }
        # let('X-API-EMAIL') { normal_user.email }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/person_records_response'

          describe 'attributes match database values' do
            run_test! do
              expect(response_data.count).to eq(1)
              response_data.first['attributes'].each do |key, value|
                expect(person_record.send(key)).to eq(value)
              end
            end
          end
        end
      end
    end
  end
end
