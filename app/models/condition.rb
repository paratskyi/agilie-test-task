# == Schema Information
#
# Table name: conditions
#
#  id                 :uuid             not null, primary key
#  value              :string           not null
#  operator           :string           not null
#  associations_chain :string           not null, is an Array
#  model              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Condition < ApplicationRecord
end
