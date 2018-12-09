source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'sqlite3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 0.18'
  gem 'rails_12factor'
end

gem 'pg', '~> 0.18'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# gem for datetime validation
gem 'validates_timeliness', '~> 5.0.0.alpha3'

#gem for populating db with fake data
gem 'faker', '~> 1.9.1'

#gem for phonenumber validation
gem 'telephone_number'

#gem for Annotation 
gem 'annotate', git: 'https://github.com/ctran/annotate_models.git'

# Gemfile for Rails 3+, Sinatra, and Merb
gem 'will_paginate', '~> 3.1.0'

#Active Model Serializer
gem 'active_model_serializers'

#gem Knock
gem 'knock'

#gem cors for communicating with front
gem 'rack-cors', require: 'rack/cors' 
 
#gem prawn for PDF report
gem 'prawn'
gem 'prawn-table'

#gem carrierwave to upload images
gem 'carrierwave', '~> 1.0'

#gem mini_magick to use image formating in carrierwave
gem 'mini_magick'

#httparty
gem 'httparty'
#truncate gem
gem 'truncate_html'

#requests by ip
gem 'rack-attack'