class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]
  before_action :set_post
  before_action :set_comment, only: [:destroy, :edit, :update]
  after_action :verify_authorized, only: [:destroy, :edit, :update]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to @post, notice: "Comment added."
    else
      redirect_to @post, alert: "Unable to add comment."
    end
  end

  def edit
    authorize @comment
  end

  def update
    authorize @comment
    if @comment.update(comment_params)
      redirect_to @post, notice: "Comment updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @comment
    @comment.destroy
    redirect_to @post, notice: "Comment deleted."
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
