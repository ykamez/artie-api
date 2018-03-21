# README

## Ruby version
v2.4.3

## Setup

### development
1. Clone this repository
2. Add `.env` file.
	1. Add TWITTER_APP_KEY, TWITTER_APP_SECRET for twitter omniauth.
	2. Add GOOGLE_STORAGE_ACCESS_KEY_ID, GOOGLE_STORAGE_SECRET_ACCESS_KEY for google storage.
3. Run `bundle install  --path vendor/bundle`
4. Run `rake db:create`
5. Run `bundle exec rake db:migrate`
6. Run `./bin/rails s`
7. Enjoy!
