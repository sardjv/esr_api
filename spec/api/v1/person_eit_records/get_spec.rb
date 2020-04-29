require 'swagger_helper'

describe 'Api::V1::PersonEitRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:person_eit_record) { create(:person_eit_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/person_eit_records/{id}' do
    get 'person_eit record' do
      tags 'PersonEitRecord'
      # security [{ apiToken: [] }, { apiEmail: [] }]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { person_eit_record.id }

      context 'when a normal user' do
        # let('X-API-TOKEN') { normal_user.authentication_token }
        # let('X-API-EMAIL') { normal_user.email }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/person_eit_record_response'

          describe 'attributes match database values' do
            run_test! do
              response_data['attributes'].each do |key, value|
                expect(person_eit_record.send(key).to_s).to eq(value.to_s)
              end
            end
          end
        end
      end
    end
  end
end
