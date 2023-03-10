# == Schema Information
#
# Table name: contracts
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :text
#  user_id     :uuid
#  supplier_id :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :contract do
    name { "MyString" }
    description { "MyText" }
    user { "" }
    supplier { "" }
  end
end
