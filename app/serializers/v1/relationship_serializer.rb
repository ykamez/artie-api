module V1
  class RelationshipSerializer < ActiveModel::Serializer
    attributes :id, :follower, :followed

    def follower
      User.find(follower_id)
    end

    def followed
      User.find(followed_id)
    end
  end
end
