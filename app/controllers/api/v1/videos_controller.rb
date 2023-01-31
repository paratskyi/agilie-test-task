module Api
  module V1
    class VideosController < ApplicationController
      def index
        result = Videos::List.perform(index_params)

        render json: result[:data],
               meta: result[:meta],
               each_serializer: serializer,
               include: '**'
      end

      def show
        result = Video.find_by!(video_id)
      rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }, status: :not_found
      else
        render json: result, serializer: serializer, include: '**'
      end

      def create
        @video = Video.new(create_params)

        if @video.valid?
          Videos::Create.perform(create_params)
          render json: { message: 'Video in processing' }, status: :ok
        else
          render json: { messages: @video.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def index_params
        params.permit(:limit, :offset)
      end

      def video_id
        params.permit(:id)
      end

      def create_params
        params.permit(:title, :description, :record)
      end

      def serializer
        ::Api::V1::VideoSerializer
      end
    end
  end
end
