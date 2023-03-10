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
require 'rails_helper'

RSpec.describe Condition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
