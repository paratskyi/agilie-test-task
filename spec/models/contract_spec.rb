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
require 'rails_helper'

RSpec.describe Contract, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
