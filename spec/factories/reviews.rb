# == Schema Information
#
# Table name: reviews
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  article_id       :integer          not null
#  text             :string(255)
#  evaluation_point :decimal(3, 1)    default(0.0), not null
#  likes_count      :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_reviews_on_article_id              (article_id)
#  index_reviews_on_user_id                 (user_id)
#  index_reviews_on_user_id_and_article_id  (user_id,article_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :review do
    text 'Bitcoin is very good.'
    evaluation_point '0.0'
  end
end
