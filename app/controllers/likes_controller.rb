class LikesController < ApplicationController

  def create
    @goal = Goal.find(params[:goal_id])
    like = current_user.likes.build(goal_id: params[:goal_id])
    like.save
    like_num
  end

  def destroy
    @goal = Goal.find(params[:goal_id])
    like = Like.find_by(goal_id: params[:goal_id], user_id: current_user.id)
    like.destroy
    like_num
  end

  private
  def like_num
    num = Like.count
    @goal.update(like: num)
  end
  
end
