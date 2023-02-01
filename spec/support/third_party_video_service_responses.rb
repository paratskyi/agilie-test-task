require 'sinatra'

ERROR_RESPONSES_MAPPER = {
  'Bad request' => 400,
  'Authorization required' => 401,
  'Not allowed' => 403,
  'Not found' => 404,
  'Already exists' => 409,
  'Rate limited' => 420
}.freeze

post '/process' do
  title = JSON.parse(params.keys.first)['title']
  message, status = ERROR_RESPONSES_MAPPER.select { |k, _v| k == title }.first
  build_response(message, status)
end

def build_response(message, status)
  message ||= 'Success'
  status  ||= 200

  {
    status: status,
    message: message
  }.to_json
end
