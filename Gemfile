source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'

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

  # ci
  gem 'fincop', require: false

  # rubocop pr comment gems
  gem 'checkstyle_filter-git'
  gem 'github_status_notifier'
  gem 'rubocop-checkstyle_formatter'
  gem 'rubocop-select'
  gem 'saddler'
  gem 'saddler-reporter-github'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_rewinder'
  gem 'timecop'
  gem 'webmock'
end

# infra
gem 'newrelic_rpm'
gem 'raven-transports-fluentd'
gem 'sentry-raven'

# database
gem 'activerecord-import'
gem 'activerecord-refresh_connection'
gem 'makara'
gem 'ridgepole'

# config
gem 'config'

# json schema validator.
gem 'committee'
gem 'committee-rails'

# web
gem 'active_model_serializers', '~> 0.10.0'

# aws
gem 'aws-sdk', '~> 2.1'
gem 'aws-sdk-core'

gem 'faraday'
gem 'faraday_middleware'
gem 'redis', '~> 3'
gem 'redis-namespace'
gem 'shrine'
gem 'sidekiq', '~> 4'

