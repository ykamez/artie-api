# == Schema Information
#
# Table name: review_evaluations
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  review_id       :integer          not null
#  evaluation_type :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_review_evaluations_on_review_id              (review_id)
#  index_review_evaluations_on_user_id                (user_id)
#  index_review_evaluations_on_user_id_and_review_id  (user_id,review_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (review_id => reviews.id)
#  fk_rails_...  (user_id => users.id)
#

class ReviewEvaluation < ApplicationRecord
  belongs_to :review
  enum evaluation_type: { like: 0 }
  counter_culture :review, column_name: ->(model) { "#{model.evaluation_type}s_count" }
end