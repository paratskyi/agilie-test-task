module Api
  module V1
    class VideoSerializer < ActiveModel::Serializer
      attributes :title, :description, :record_url

      def record_url
        Rails.application.routes.url_helpers.url_for(object.record) if object.record.attached?
      end
    end
  end
end
