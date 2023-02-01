source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'active_model_serializers', '~> 0.10.13'
gem 'httparty', '~> 0.21.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7', '>= 6.1.7.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'rswag-api', '~> 2.8'
gem 'rswag-ui', '~> 2.8'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'sinatra', '~> 3.0', '>= 3.0.5'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.21'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'rswag-specs', '~> 2.8'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0'
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'listen', '~> 3.3'
  gem 'rubocop-rails', '~> 2.17', '>= 2.17.4'
  gem 'rubocop-rspec', '~> 2.18', '>= 2.18.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
