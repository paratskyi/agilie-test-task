module Videos
  class Create < ApplicationService
    SUCCESS_STATUSES = [200, 201].freeze

    ERRORS_MAPPER = {
      400 => ThirdPartyVideoProcessErrors::BadRequestError,
      401 => ThirdPartyVideoProcessErrors::AuthorizationRequiredError,
      403 => ThirdPartyVideoProcessErrors::NotAllowedError,
      404 => ThirdPartyVideoProcessErrors::NotFoundError,
      409 => ThirdPartyVideoProcessErrors::AlreadyExistsError,
      420 => ThirdPartyVideoProcessErrors::RateLimitedError
    }.freeze

    def initialize(title:, description:, record_path:, original_filename:, content_type:, process_id:)
      @title = title
      @description = description
      @record_path = record_path
      @original_filename = original_filename
      @content_type = content_type
      @process_id = process_id
    end

    def perform
      ActiveRecord::Base.transaction do
        @video = Video.new(title: @title, description: @description)
        @video.record.attach(io: File.open(@record_path), filename: @original_filename, content_type: @content_type)
        @video.save!
        run_processing
      ensure
        send_notification
      end
    end

    private

    def run_processing
      @result = ThirdPartyVideoProcess.perform(@video)
      status = @result[:status]
      return if status.in?(SUCCESS_STATUSES)

      raise ERRORS_MAPPER[status]
    end

    def send_notification
      # Notify user about processing result via sockets
      ActionCable.server.broadcast('system_notification_channel', title: 'Video processing finished', body: prepare_response)
    end

    def prepare_response
      @result.merge(process_id: @process_id)
    end
  end
end
