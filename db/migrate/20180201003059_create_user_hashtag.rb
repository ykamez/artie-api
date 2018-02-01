class CreateUserHashtag < ActiveRecord::Migration[5.1]
  def change
    create_table :user_hash_tags do |t|
      t.bigint  "user_id",    null: false
      t.bigint  "hash_tag_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index "user_hash_tags", ["user_id"], name: "index_user_hash_tags_on_user_id", using: :btree
    add_index "user_hash_tags", ["hash_tag_id"], name: "index_user_hash_tags_on_hash_tag_id", using: :btree

    add_foreign_key "user_hash_tags", "users"
    add_foreign_key "user_hash_tags", "hash_tags"
  end
end
