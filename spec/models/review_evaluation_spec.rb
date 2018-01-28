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
#  fk_rails_96eaf66f6c                                (review_id)
#  index_review_evaluations_on_user_id_and_review_id  (user_id,review_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (review_id => reviews.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe ReviewEvaluation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
