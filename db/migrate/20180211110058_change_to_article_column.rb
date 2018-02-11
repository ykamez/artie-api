class ChangeToArticleColumn < ActiveRecord::Migration[5.1]
  def change
    change_column_null :articles, :image_url, true
  end
end
