namespace :calulate_user_evaluation do
  # FIXME: 毎回全ての投稿を計算しなおしていたら、負荷が高いため、元の評価と評価数を元に、加重平均を取る形に変更する(案1)
  CALC_INTERVAL = 30.minutes
  desc 'Calculate user evaluation point by tweets every 30mins'
  task do: :environment do
    all_posts = Review.all
    users = User.all
    post_evaluations = ReviewEvaluation.all
    # FIXME: commet out for mock.
    # posts = Post.where('created_at > ?', Time.now - CALC_INTERVAL)
    posts = Review.all
    user_ids = posts.pluck(:user_id).uniq

    user_ids.each do |user_id|
      user = users.find(user_id)
      user_posts = all_posts.where(user_id: user_id)
      user_gathering_reactions = post_evaluations.where(review_id: user_posts.pluck(:id))
      user_liked_posts = user_gathering_reactions.where(evaluation_type: 'like')
      point = user_liked_posts.size*5/user_gathering_reactions.size.to_f
      user.update!(evaluation_point: point)
    end
  end
end
