class CreateHashTags < ActiveRecord::Migration[5.1]
  def change
    create_table :hash_tags do |t|
      t.string   'name',       null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false

      t.index 'name', name: 'index_hash_tags_evaluations_on_name', unique: true, using: :btree
    end
  end
end
