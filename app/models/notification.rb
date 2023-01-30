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
class Notification < ApplicationRecord
  validates :title, :body, presence: true
end
