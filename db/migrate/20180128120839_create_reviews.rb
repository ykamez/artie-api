class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.bigint  'user_id',    null: false
      t.bigint  'article_id',    null: false
      t.string 'text',       null: true
      t.decimal 'evaluation_point', null: false, default: 0.0, precision: 3, scale: 1
      t.integer 'likes_count', null: false, default: 0
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end

    # add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree
    # add_index "reviews", ["article_id"], name: "index_reviews_on_article_id", using: :btree
    add_index 'reviews', ['user_id', 'article_id'], unique: true, using: :btree

    add_foreign_key 'reviews', 'users'
    add_foreign_key 'reviews', 'articles'
  end
end
