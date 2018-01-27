# == Schema Information
#
# Table name: article_hash_tags
#
#  id          :integer          not null, primary key
#  article_id  :integer          not null
#  hash_tag_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_article_hash_tags_on_article_id   (article_id)
#  index_article_hash_tags_on_hash_tag_id  (hash_tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (hash_tag_id => hash_tags.id)
#

class ArticleHashTag < ApplicationRecord
  belongs_to :review
  belongs_to :hash_tag
end
