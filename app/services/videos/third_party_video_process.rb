require 'httparty'

module Videos
  class ThirdPartyVideoProcess < ApplicationService
    # BASE_URL = 'https://api.third-party-video-service.com'.freeze
    BASE_URL = 'http://localhost:4567'.freeze
    BASE_HEADERS = { 'Accept' => 'application/json' }.freeze

    def initialize(video)
      @video = video
      @blob = video.record_blob
    end

    def perform
      make_request
    end

    private

    def make_request
      response = HTTParty.post(endpoint, body: request_body, headers: headers)

      JSON.parse(response).symbolize_keys
    end

    def headers
      BASE_HEADERS
    end

    def endpoint
      "#{BASE_URL}/process"
    end

    def request_body
      {
        id: @blob.id,
        title: @video.title,
        key: @blob.key,
        filename: @blob.filename
      }.to_json
    end
  end
end
