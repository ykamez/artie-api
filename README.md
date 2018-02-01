# README

## Ruby version
v2.4.3

## Setup

### development
1. Clone this repository
2. Copy config/settings/development.yml to config/settings/development.local.yml.
    1. `cp config/settings/development.yml config/settings/development.local.yml`
    2. Configure DB settings and mailer settings on config/settings/development.local.yml
        - write your mysql root password
        - DB user's password must not be blank.
    3. add `.env` file and write devise and twitter key.
3. Run `bundle install  [--path vendor/bundle]`
4. Run `rake db:create`
5. Run `bundle exec rake db:migrate`
6. Run `./bin/rails s`
