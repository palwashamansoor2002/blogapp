module Admin
  class DashboardController < BaseController
    def index
      @posts_count = Post.count
      @recent_posts = Post.order(created_at: :desc).limit(5)
    end
  end
end
