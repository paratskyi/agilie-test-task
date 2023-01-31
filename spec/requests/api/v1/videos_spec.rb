require 'swagger_helper'

RSpec.describe 'api/v1/videos', type: :request do

  path '/api/v1/videos' do
    get 'videos list' do
      tags 'Videos'
      produces 'application/json', 'application/xml'

      parameter name: :limit, in: :query, type: :integer, schema: { type: :integer }, required: false
      parameter name: :offset, in: :query, type: :integer, schema: { type: :integer }, required: false

      let(:limit) { 10 }
      let(:offset) { 0 }

      shared_examples 'return videos list' do
        response 200, 'returns videos list' do
          schema type: :object,
                 properties: {
                   data: { type: :array, items: { '$ref' => '#/components/schemas/video' } },
                   meta: { '$ref' => '#/components/schemas/list_meta' }
                 },
                 required: %w[data meta]

          it 'returns expected videos' do |example|
            submit_request(example.metadata)
            assert_response_matches_metadata(example.metadata)
            body = JSON.parse(response.body)
            expect(body['data'].count).to eq(expected_videos.count)
            expect(body['meta']).to include('total' => expected_videos.count)
          end
        end
      end

      context 'when has videos' do
        let!(:expected_videos) { create_list(:video, 5) }

        it_behaves_like 'return videos list'
      end

      context 'when has no videos' do
        let(:expected_videos) { [] }

        it_behaves_like 'return videos list'
      end
    end
  end

  path '/api/v1/videos/{id}' do

    get 'show video' do
      tags 'Videos'
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :string, schema: { type: :string }, required: true

      let(:other_videos) { create_list(:video, 2) }

      shared_examples 'return video' do
        response 200, 'returns video' do
          schema type: :object, properties: { data: { '$ref' => '#/components/schemas/video' } }

          it 'returns expected video' do |example|
            submit_request(example.metadata)
            assert_response_matches_metadata(example.metadata)
            body = JSON.parse(response.body)
            expect(body['data']['id']).to eq(expected_video.id)
          end
        end
      end

      context 'when has video' do
        let(:expected_video) { create(:video) }
        let(:id) { expected_video.id }

        it_behaves_like 'return video'
      end

      context 'when id is invalid' do
        response '404', 'video not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end

  path '/api/v1/videos' do
    post 'Creates a blog' do
      tags 'Videos'
      consumes 'application/json'
      parameter name: :video, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          record: { type: :string }
        },
        required: %w[title description]
      }

      let(:title) { FFaker::Movie.title }
      let(:description) { FFaker::Book.description }
      let(:record) { nil }

      response '200', 'video in process' do
        let(:video) { { title: title, description: description, record: record } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:title) { FFaker::Movie.title }
        let(:video) { { title: title } }
        run_test!
      end
    end
  end
end
