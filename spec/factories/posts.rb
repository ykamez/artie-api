# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  text           :string(255)      not null
#  likes_count    :integer          default(0), not null
#  dislikes_count :integer          default(0), not null
#  shares_count   :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :post do
    text 'Bitcoin is very good.'
  end
end
