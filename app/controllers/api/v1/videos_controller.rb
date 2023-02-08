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
          create_video_job = CreateVideoJob.perform_later(prepare_params_for_create_job)
          render json: { message: 'Video in processing', process_id: create_video_job.job_id }, status: :ok
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
        params.require(:video).permit(:title, :description, :record)
      end

      def prepare_params_for_create_job
        {
          title: create_params[:title],
          description: create_params[:description],
          record_path: create_params[:record].path,
          original_filename: create_params[:record].original_filename,
          content_type: create_params[:record].content_type
        }
      end

      def serializer
        ::Api::V1::VideoSerializer
      end
    end
  end
end
