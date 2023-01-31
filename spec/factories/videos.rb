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
    record { nil }
  end
end
