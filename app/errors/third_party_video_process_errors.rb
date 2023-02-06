class ThirdPartyVideoProcessErrors
  class BadRequestError < StandardError; end
  class AuthorizationRequiredError < StandardError; end
  class NotAllowedError < StandardError; end
  class NotFoundError < StandardError; end
  class AlreadyExistsError < StandardError; end
  class RateLimitedError < StandardError; end
end
