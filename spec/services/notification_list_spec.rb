require 'rails_helper'

RSpec.describe NotificationList do
  subject(:notification_list) { described_class.perform(params) }

  let(:params) do
    {
      limit: limit,
      offset: offset
    }
  end

  let(:limit) { 10 }
  let(:offset) { 0 }

  describe '#perform' do
    shared_examples 'return expected notifications' do
      it 'returns expected notifications' do
        expect(notification_list[:data]).to eq(expected_notifications)
        expect(notification_list[:meta]).to eq({
                                                 total: expected_notifications.count,
                                                 limit: limit,
                                                 offset: offset
                                               })
      end
    end

    let!(:notifications) { create_list(:notification, 5) }

    context 'when has notifications' do
      let!(:expected_notifications) { notifications }

      it_behaves_like 'return expected notifications'

      context 'with limit is 2' do
        let(:limit) { 2 }
        let(:expected_notifications) { notifications.first(2) }

        it_behaves_like 'return expected notifications'
      end

      context 'with limit is nil' do
        let(:limit) { nil }
        let(:expected_notifications) { notifications }

        it_behaves_like 'return expected notifications'

        context 'and offset is 2' do
          let(:offset) { 3 }
          let(:expected_notifications) { notifications.last(2) }

          it_behaves_like 'return expected notifications'
        end
      end

      context 'with limit is 0' do
        let(:limit) { 0 }
        let(:expected_notifications) { [] }

        it_behaves_like 'return expected notifications'
      end

      context 'with offset is 2' do
        let(:offset) { 3 }
        let(:expected_notifications) { notifications.last(2) }

        it_behaves_like 'return expected notifications'
      end

      context 'with order' do
        let!(:notifications) do
          [
            create(:notification, created_at: DateTime.current + 3),
            create(:notification, created_at: DateTime.current + 2),
            create(:notification, created_at: DateTime.current + 1)
          ]
        end
        let(:expected_notifications) { notifications.reverse }

        it_behaves_like 'return expected notifications'
      end
    end

    context 'when has no notifications' do
      let!(:notifications) { [] }
      let(:expected_notifications) { [] }

      it_behaves_like 'return expected notifications'
    end
  end
end
