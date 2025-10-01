class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show], unless: :devise_controller?
  before_action :authorize_post, only: [ :edit, :update, :destroy]


  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.new
    authorize @post
  end

  def create
    @post = current_user.posts.new(post_params)
    authorize @post
    if @post.save
      redirect_to @post, notice: "Post created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_post
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
