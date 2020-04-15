require 'swagger_helper'

describe 'Api::V1::PersonRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:person_record) { create(:person_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/person_records/{id}' do
    get 'person record' do
      tags 'PersonRecord'
      # security [{ apiToken: [] }, { apiEmail: [] }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { person_record.id }

      context 'when a normal user' do
        # let('X-API-TOKEN') { normal_user.authentication_token }
        # let('X-API-EMAIL') { normal_user.email }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/person_record_response'

          describe 'attributes match database values' do
            run_test! do
              response_data['attributes'].each do |key, value|
                expect(person_record.send(key).to_s).to eq(value.to_s)
              end
            end
          end
        end
      end
    end
  end
end
