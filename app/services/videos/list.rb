module Videos
  class List < ApplicationService
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
      @collection = Video.all.with_attached_record
    end

    def order_collection!
      @collection = @collection.order(:title)
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
end
