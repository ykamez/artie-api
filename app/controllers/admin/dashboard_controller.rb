class Admin::DashboardController < AdminController

  def index
    @articles_count = Article.count
    @users_count = User.count
    @reviews_count = Review.count
    @likes_count = Review.sum_likes
    @articles = Article.order(created_at: :desc)
  end
end
