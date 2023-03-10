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
class Contract < ApplicationRecord
  belongs_to :supplier
  belongs_to :user

  validates :user_id, uniqueness: true
end
