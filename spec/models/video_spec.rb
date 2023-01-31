# == Schema Information
#
# Table name: videos
#
#  id          :uuid             not null, primary key
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Video, type: :model do
  subject { create(:video) }

  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:uuid).with_options(null: false, primary: true) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:text).with_options(null: false) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
