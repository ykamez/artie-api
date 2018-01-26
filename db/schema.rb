# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do
  create_table 'article_hash_tags', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'article_id', null: false
    t.bigint 'hash_tag_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'index_article_hash_tags_on_article_id'
    t.index ['hash_tag_id'], name: 'index_article_hash_tags_on_hash_tag_id'
  end

  create_table 'articles', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'url', null: false
    t.integer 'reviews_count', default: 0, null: false
    t.decimal 'evaluation_point', precision: 3, scale: 1, default: '0.0', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['url'], name: 'index_articles_on_url', unique: true
  end

  create_table 'hash_tags', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_hash_tags_evaluations_on_name', unique: true
  end

  create_table 'relationships', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['followed_id'], name: 'index_relationships_on_followed_id'
    t.index ['follower_id', 'followed_id'], name: 'index_relationships_on_follower_id_and_followed_id', unique: true
    t.index ['follower_id'], name: 'index_relationships_on_follower_id'
  end

  create_table 'review_evaluations', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'user_id', null: false
    t.bigint 'review_id', null: false
    t.integer 'evaluation_type', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['review_id'], name: 'index_review_evaluations_on_review_id'
    t.index ['user_id', 'review_id'], name: 'index_review_evaluations_on_user_id_and_review_id', unique: true
    t.index ['user_id'], name: 'index_review_evaluations_on_user_id'
  end

  create_table 'reviews', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'user_id', null: false
    t.bigint 'article_id', null: false
    t.string 'text'
    t.decimal 'evaluation_point', precision: 3, scale: 1, default: '0.0', null: false
    t.integer 'likes_count', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'index_reviews_on_article_id'
    t.index ['user_id', 'article_id'], name: 'index_reviews_on_user_id_and_article_id', unique: true
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'user_hash_tags', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'user_id', null: false
    t.bigint 'hash_tag_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['hash_tag_id'], name: 'index_user_hash_tags_on_hash_tag_id'
    t.index ['user_id'], name: 'index_user_hash_tags_on_user_id'
  end

  create_table 'users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'fullname', null: false
    t.string 'account_name', null: false
    t.string 'image_data', default: '', null: false
    t.string 'email', null: false
    t.integer 'likes_count', default: 0, null: false
    t.integer 'following_count', default: 0, null: false
    t.integer 'followers_count', default: 0, null: false
    t.decimal 'evaluation_point', precision: 3, scale: 1, default: '0.0', null: false
    t.text 'tokens'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['uid', 'provider'], name: 'index_users_on_uid_and_provider', unique: true
  end

  add_foreign_key 'article_hash_tags', 'articles'
  add_foreign_key 'article_hash_tags', 'hash_tags'
  add_foreign_key 'review_evaluations', 'reviews'
  add_foreign_key 'review_evaluations', 'users'
  add_foreign_key 'reviews', 'articles'
  add_foreign_key 'reviews', 'users'
  add_foreign_key 'user_hash_tags', 'hash_tags'
  add_foreign_key 'user_hash_tags', 'users'
end
