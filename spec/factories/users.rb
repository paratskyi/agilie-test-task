# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
  end
end
