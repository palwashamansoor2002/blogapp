module Admin
  class PostsController < BaseController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.includes(:user).order(created_at: :desc)
    end

    def show; end

    def edit; end

    def update
      if @post.update(post_params)
        redirect_to admin_post_path(@post), notice: "Post updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: "Post deleted successfully."
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end
