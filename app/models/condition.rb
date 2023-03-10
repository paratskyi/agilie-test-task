# == Schema Information
#
# Table name: conditions
#
#  id         :uuid             not null, primary key
#  value      :string
#  operator   :string
#  comparable :string
#  model      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Condition < ApplicationRecord
end
