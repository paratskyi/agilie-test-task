class CreateVideoJob < ApplicationJob
  queue_as :default

  def perform(title:, description:, record_path:, original_filename:, content_type:)
    ::Videos::Create.perform(
      title: title,
      description: description,
      record_path: record_path,
      original_filename: original_filename,
      content_type: content_type,
      process_id: job_id
    )
  end
end
