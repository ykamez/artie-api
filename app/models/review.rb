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
#  fk_rails_bdbf711db8                      (article_id)
#  index_reviews_on_user_id_and_article_id  (user_id,article_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#

class Review < ApplicationRecord
  MIN_RATING = 1.0
  MAX_RATING = 5.0

  belongs_to :user
  belongs_to :article
  counter_culture :article

  has_many :review_evaluations, dependent: :destroy
  validates :evaluation_point, presence: true

  validate :rating_validator

  after_save do
    article.update_average_rating!
  end

  def rating_validator
    # TODO: 小数点以下の桁数に関するバリデーションを追加。
    errors.add(:evaluation_point, ' を入力してください。') if evaluation_point < MIN_RATING || evaluation_point > MAX_RATING
  end
end
