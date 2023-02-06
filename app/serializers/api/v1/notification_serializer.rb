module Api
  module V1
    class NotificationSerializer < ActiveModel::Serializer
      attributes :title, :body, :redirect_url, :created_at, :updated_at
    end
  end
end
