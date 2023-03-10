# == Schema Information
#
# Table name: suppliers
#
#  id         :uuid             not null, primary key
#  name       :string
#  spend      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :supplier do
    name { "MyString" }
    spend { 1 }
  end
end
