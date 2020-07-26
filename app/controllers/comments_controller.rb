class CommentsController < ApplicationController
  def new
    @spot = Spot.find(params[:spot_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create 
    Comment.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
