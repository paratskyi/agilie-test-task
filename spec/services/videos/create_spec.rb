require 'rails_helper'

RSpec.describe Videos::Create do
  subject(:create_video) { described_class.perform(params) }

  let(:params) do
    {
      title: title,
      description: description,
      record: record
    }
  end

  let(:title) { FFaker::Movie.title }
  let(:description) { FFaker::Book.description }
  let(:record) { nil }

  describe '#perform' do
    context 'when params is present' do
      it 'creates video successfully' do
        expect { create_video }.to change(Video, :count).by(1)
      end
    end

    context 'when params is not present' do
      let(:title) { nil }
      let(:description) { nil }

      it 'raises error' do
        expect { create_video }
          .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank, Description can't be blank")
      end
    end
  end
end
