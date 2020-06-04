require 'swagger_helper'

describe 'Api::V1::ElementRecordResource', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:element_record) { create(:element_record) }
  let(:response_data) { JSON.parse(response.body)['data'] }

  path '/api/v1/element_records/{id}' do
    get 'element record' do
      tags 'ElementRecord'
      security [JWT: {}]
      produces 'application/vnd.api+json'
      parameter name: :id, in: :path, type: :string, required: true

      let(:id) { element_record.id }

      context 'when a normal user' do
        let(:Authorization) { 'Bearer dummy_json_web_token' }

        response '200', 'successful' do
          schema '$ref' => '#/definitions/element_record_response'

          describe 'attributes match database values' do
            run_test! do
              response_data['attributes'].each do |key, value|
                expect(element_record.send(key).to_s).to eq(value.to_s)
              end
            end
          end
        end
      end
    end
  end
end
