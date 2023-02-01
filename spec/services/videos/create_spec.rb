require 'rails_helper'

RSpec.describe Videos::Create do
  subject(:create_video) { described_class.perform(params) }

  let(:params) do
    {
      title: title,
      description: description,
      record_path: record_path,
      original_filename: original_filename,
      content_type: content_type
    }
  end

  let(:title) { FFaker::Movie.title }
  let(:description) { FFaker::Book.description }
  let(:record_path) { Rails.root.join('spec/fixtures/files', file_name) }
  let(:original_filename) { file_name }
  let(:content_type) { 'video/mp4' }

  let(:file_name) { 'video_record.mp4' }

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
