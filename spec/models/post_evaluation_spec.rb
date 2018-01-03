# == Schema Information
#
# Table name: post_evaluations
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  post_id         :integer          not null
#  evaluation_type :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_post_evaluations_on_post_id  (post_id)
#  index_post_evaluations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe PostEvaluation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
