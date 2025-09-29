class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable

  def create
    @like = current_user.likes.build(like_params)
    if @like.save
      redirect_back fallback_location: root_path, notice: "Liked!"
    else
      redirect_back fallback_location: root_path, alert: "Unable to like."
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_back fallback_location: root_path, notice: "Unliked!"
  end

  private

  def like_params
    params.permit(:likeable_type, :likeable_id)
  end

  def set_likeable
    if params[:post_id]
      @likeable = Post.find(params[:post_id])
    elsif params[:comment_id]
      @likeable = Comment.find(params[:comment_id])
    else
      redirect_to root_path, alert: "Likeable not found."
    end
  end
end
