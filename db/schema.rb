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
  create_table 'hashtags', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_hashtags_evaluations_on_name', unique: true
  end

  create_table 'post_evaluations', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.integer 'evaluation_type', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_post_evaluations_on_post_id'
    t.index ['user_id'], name: 'index_post_evaluations_on_user_id'
  end

  create_table 'post_hashtags', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'post_id', null: false
    t.bigint 'hashtag_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['hashtag_id'], name: 'index_post_hashtags_on_hashtag_id'
    t.index ['post_id'], name: 'index_post_hashtags_on_post_id'
  end

  create_table 'post_images', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'post_id', null: false
    t.string 'image_data', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_post_images_on_post_id'
  end

  create_table 'posts', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'user_id', null: false
    t.string 'text', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'display_name', null: false
    t.string 'icon_data', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'post_evaluations', 'posts'
  add_foreign_key 'post_evaluations', 'users'
  add_foreign_key 'post_hashtags', 'hashtags'
  add_foreign_key 'post_hashtags', 'posts'
  add_foreign_key 'post_images', 'posts'
  add_foreign_key 'posts', 'users'
end
