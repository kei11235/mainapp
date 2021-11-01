class CommentsController < ApplicationController
  def index
    @goal = Goal.find(params[:goal_id])
    @user = @goal.user
    @comments = @goal.comments.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(commment_params)
  end

  private
  def commment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, goal_id: params[:goal_id])
  end

end
