source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3'
end
group :production do
  gem 'puma'
  gem 'pg'
  gem 'rails_12factor'
end 

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sprockets-rails', '2.3.3'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem "jquery-ui-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'table_print'

# wysiwyg
gem 'bootsy'
gem 'fog'

gem 'acts_as_votable', '~> 0.10.0'

# autocomplete for tagging gems (3gems)
gem 'acts-as-taggable-on', '~> 3.4'
gem 'rails4-autocomplete'
gem 'simple_form'

# for better url ids
gem 'friendly_id', '~> 5.1.0'

# for image management
gem 'paperclip'
gem 'aws-sdk-v1'
gem 'aws-s3'

# Use Unicorn as the app server
gem 'unicorn'

# for Authentication
gem 'devise'

# vanity URLs
gem 'friendly_id', '~> 5.1.0'

# for all the emails
gem 'mailgun-ruby', '~>1.0.0'

gem 'rack-mini-profiler', require: false
gem 'rubocop', require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'better_errors'

  # optimization
  gem 'bullet'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end
