require 'swagger_helper'

RSpec.describe 'api/v1/notifications', type: :request do

  path '/api/v1/notifications' do
    get 'notifications list' do
      tags 'Notifications'
      produces 'application/json', 'application/xml'

      parameter name: :limit, in: :query, type: :integer, schema: { type: :integer }, required: false
      parameter name: :offset, in: :query, type: :integer, schema: { type: :integer }, required: false

      let(:limit) { 10 }
      let(:offset) { 0 }

      shared_examples 'return notifications list' do
        response 200, 'returns notifications list' do
          schema type: :object,
                 properties: {
                   data: { type: :array, items: { '$ref' => '#/components/schemas/notification' } },
                   meta: { '$ref' => '#/components/schemas/list_meta' }
                 },
                 required: %w[data meta]

          it 'returns expected notifications' do |example|
            submit_request(example.metadata)
            assert_response_matches_metadata(example.metadata)
            body = JSON.parse(response.body)
            expect(body['data'].count).to eq(expected_notifications.count)
            expect(body['meta']).to include('total' => expected_notifications.count)
          end
        end
      end

      context 'when has notifications' do
        let!(:expected_notifications) { create_list(:notification, 5) }

        it_behaves_like 'return notifications list'
      end

      context 'when has no notifications' do
        let(:expected_notifications) { [] }

        it_behaves_like 'return notifications list'
      end
    end
  end
end
