class NotificationList < ApplicationService

  def initialize(params)
    @limit = params[:limit]
    @offset = params[:offset]
  end

  def perform
    load_collection
    order_collection!
    paginated_collection!
    prepare_response
  end

  private

  def load_collection
    @collection = Notification.all
  end

  def order_collection!
    @collection = @collection.order(:created_at)
  end

  def paginated_collection!
    @collection = @collection.limit(@limit).offset(@offset)
  end

  def prepare_response
    {
      data: @collection,
      meta: {
        limit: @limit,
        offset: @offset,
        total: @collection.count
      }
    }
  end
end
