module Api
  module V1
    class NotificationsController < ApplicationController
      def index
        result = NotificationList.perform(index_params)

        render json: result[:data],
               meta: result[:meta],
               each_serializer: ::Api::V1::NotificationSerializer,
               include: '**'
      end

      private

      def index_params
        params.permit(:limit, :offset)
      end
    end
  end
end
