module Api
  module V1
    class ConditionsController < ApplicationController
      def index
        result = ::Condition.all

        render json: result,
               each_serializer: serializer,
               include: '**'
      end

      def create
        result = ::Condition.create!(create_params)

        render json: result, serializer: serializer, include: '**'
      end

      private

      def serializer
        ::Api::V1::ConditionSerializer
      end

      def create_params
        params.require(:condition).permit(:value, :operator, :model, comparable: [])
      end
    end
  end
end
