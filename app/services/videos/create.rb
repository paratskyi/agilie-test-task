module Videos
  class Create < ApplicationService

    def initialize(params)
      @params = params
    end

    def perform
      Video.create!(@params)
    end
  end
end
