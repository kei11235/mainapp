class CommentsController < ApplicationController
  def index
    @goal = Goal.find(params[:goal_id])
    @user = @goal.user
    @comments = @goal.comments.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(commment_params)
    @goal = @comment.goal
    @comments = @goal.comments.all
    @user = @goal.user
    if @comment.save
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end

  private
  def commment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, goal_id: params[:goal_id])
  end

end
