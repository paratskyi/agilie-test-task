require 'rails_helper'

RSpec.describe Videos::List do
  subject(:video_list) { described_class.perform(params) }

  let(:params) do
    {
      limit: limit,
      offset: offset
    }
  end

  let(:limit) { 10 }
  let(:offset) { 0 }

  describe '#perform' do
    shared_examples 'return expected videos' do
      it 'returns expected videos' do
        expect(video_list[:data]).to eq(expected_videos)
        expect(video_list[:meta]).to eq({
                                          total: expected_videos.count,
                                          limit: limit,
                                          offset: offset
                                        })
      end
    end

    let!(:videos) do
      [
        create(:video, title: 'a'),
        create(:video, title: 'b'),
        create(:video, title: 'c'),
        create(:video, title: 'e'),
        create(:video, title: 'f')
      ]
    end

    context 'when has videos' do
      let!(:expected_videos) { videos }

      it_behaves_like 'return expected videos'

      context 'with limit is 2' do
        let(:limit) { 2 }
        let(:expected_videos) { videos.first(2) }

        it_behaves_like 'return expected videos'
      end

      context 'with limit is nil' do
        let(:limit) { nil }
        let(:expected_videos) { videos }

        it_behaves_like 'return expected videos'

        context 'with offset is 2' do
          let(:offset) { 3 }
          let(:expected_videos) { videos.last(2) }

          it_behaves_like 'return expected videos'
        end
      end

      context 'with limit is 0' do
        let(:limit) { 0 }
        let(:expected_videos) { [] }

        it_behaves_like 'return expected videos'
      end

      context 'with offset is 2' do
        let(:offset) { 3 }
        let(:expected_videos) { videos.last(2) }

        it_behaves_like 'return expected videos'
      end

      context 'with order' do
        let!(:videos) do
          [
            create(:video, title: 'c'),
            create(:video, title: 'b'),
            create(:video, title: 'a')
          ]
        end
        let(:expected_videos) { videos.reverse }

        it_behaves_like 'return expected videos'
      end
    end

    context 'when has no videos' do
      let!(:videos) { [] }
      let(:expected_videos) { [] }

      it_behaves_like 'return expected videos'
    end
  end
end
