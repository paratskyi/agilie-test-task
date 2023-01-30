# == Schema Information
#
# Table name: notifications
#
#  id           :uuid             not null, primary key
#  title        :string           not null
#  body         :text             not null
#  redirect_url :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :notification do
    title { FFaker::Game.title }
    body { FFaker::Tweet.body }
    redirect_url { FFaker::Internet.http_url }
  end
end
