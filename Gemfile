source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'
gem 'rails-i18n'
gem 'mysql2'
gem 'unicorn'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'pry-byebug'

  # Runs tests using several CPU
  gem 'parallel_tests'

  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'rspec-json_matcher'
  gem 'rspec-rails', '~> 3.5'

  # rubocop pr comment gems
  gem 'checkstyle_filter-git'
  gem 'github_status_notifier'
  gem 'rubocop'
  gem 'rubocop-checkstyle_formatter'
  gem 'rubocop-rspec'
  gem 'rubocop-select'
  gem 'saddler'
  gem 'saddler-reporter-github'
end

group :development do
  # Update schema comments on models and factories after each migration.
  gem 'annotate'

  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_rewinder'
  gem 'timecop'
end

# database
gem 'activerecord-import'
gem 'activerecord-refresh_connection'

# config
gem 'config'

# json schema
gem 'committee'
gem 'committee-rails'
gem 'prmd'

# web
gem 'active_model_serializers', '~> 0.10.0'

gem 'faraday'
gem 'faraday_middleware'

# devise
gem 'devise'
gem 'devise_token_auth'
gem 'omniauth'
gem 'omniauth-twitter'

# クロスドメイン対策
gem 'rack-cors'

# count like, dislike,etc.
gem 'counter_culture'

# open graph protocol
gem 'metainspector'

# Added at 2018-01-28 19:24:43 +0900 by yogoken:
gem 'appengine', '~> 0.4.5'

gem 'dotenv-rails'

gem 'erb2haml', '~> 0.1'
gem 'haml-rails', '~> 1.0'
gem 'sass-rails', '~> 5.0'

# Use google cloud storage for image
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-google'
gem "google-api-client", "> 0.8.5", "< 0.9"
gem "mime-types"
