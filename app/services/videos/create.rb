module Videos
  class Create < ApplicationService

    def initialize(title:, description:, record_path:, original_filename:, content_type:)
      @title = title
      @description = description
      @record_path = record_path
      @original_filename = original_filename
      @content_type = content_type
    end

    def perform
      ActiveRecord::Base.transaction do
        video = Video.new(title: @title, description: @description)
        video.record.attach(io: File.open(@record_path), filename: @original_filename, content_type: @content_type)
        video.save!
        # process_video
      end
    end
  end
end
