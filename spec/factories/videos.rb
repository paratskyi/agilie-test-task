# == Schema Information
#
# Table name: videos
#
#  id          :uuid             not null, primary key
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :video do
    title { FFaker::Movie.title }
    description { FFaker::Book.description }

    trait :with_record do
      after :build do |video|
        file_name = 'video_record.mp4'
        file_path = Rails.root.join('spec/fixtures/files', file_name)
        video.record.attach(io: File.open(file_path), filename: file_name, content_type: 'video/mp4')
      end
    end
  end
end
