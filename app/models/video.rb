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
class Video < ApplicationRecord
  has_one_attached :record

  validates :title, :description, presence: true
end
