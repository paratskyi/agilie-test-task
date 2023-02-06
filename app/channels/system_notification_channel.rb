class SystemNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'system_notification_channel'
  end

  def unsubscribed
    stop_all_streams
  end
end
