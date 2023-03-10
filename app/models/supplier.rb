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
class Supplier < ApplicationRecord
  has_many :contracts
end
