# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string(255)      default("email"), not null
#  uid                    :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  fullname               :string(255)      not null
#  image_data             :string(255)      default(""), not null
#  email                  :string(255)      not null
#  likes_count            :integer          default(0), not null
#  following_count        :integer          default(0), not null
#  followers_count        :integer          default(0), not null
#  evaluation_point       :decimal(3, 1)    default(0.0), not null
#  tokens                 :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[twitter]
  has_many :reviews, dependent: :destroy
  has_many :review_evaluations, dependent: :destroy

  # follow and follower relationship
  has_many :active_relationships, class_name:  'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  # def self.find_or_create_from_auth(auth)
  #   provider = auth[:provider]
  #   uid = auth[:uid]
  #   nickname = auth[:info][:nickname]
  #   image_url = auth[:info][:image]
  #
  #   user = find_by(uid: uid, provider: provider)
  #   # TODO: Fix the way to set tokens.
  #   user ||= User.create!(
  #     uid:      uid,
  #     account_name: nickname,
  #     fullname: nickname,
  #     image_data: image_url,
  #     provider: provider,
  #     email:    User.dummy_email(auth),
  #     password: Devise.friendly_token[0, 20],
  #   )
  #   user
  # end

  def send_on_create_confirmation_instructions
    # TODO: Fix it.
  end

  def admin?
    fullname.in? ENV['ADMIN_USERS'].split(/\s*,\s*/)
  end

  private

    def self.dummy_email(auth)
      "#{auth[:uid]}-#{auth[:provider]}@example.com"
    end
end
