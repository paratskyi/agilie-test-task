# == Schema Information
#
# Table name: notifications
#
#  id           :uuid             not null, primary key
#  title        :string           not null
#  body         :text             not null
#  redirect_url :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  subject { create(:notification) }

  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:uuid).with_options(null: false, primary: true) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:body).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:redirect_url).of_type(:string) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
