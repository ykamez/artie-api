class CreateArticleHashTags < ActiveRecord::Migration[5.1]
  def change
    create_table :article_hash_tags do |t|
      t.bigint  'article_id',    null: false
      t.bigint  'hash_tag_id', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
    add_index 'article_hash_tags', ['article_id'], name: 'index_article_hash_tags_on_article_id', using: :btree
    add_index 'article_hash_tags', ['hash_tag_id'], name: 'index_article_hash_tags_on_hash_tag_id', using: :btree

    add_foreign_key 'article_hash_tags', 'articles'
    add_foreign_key 'article_hash_tags', 'hash_tags'
  end
end
