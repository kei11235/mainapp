class GoalsController < ApplicationController

  def index
    # @goals = Goal.all
    @q = Goal.ransack(params[:q])
    @results = @q.result(distinct: true).order('achievement DESC')
    if user_signed_in?
      @goal = current_user.goals.order('created_at DESC')
    end
  end

  def show
    @goal = Goal.find(params[:id])
    @user = @goal.user
    @goals = @user.goals.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_tasks_path(@goal.id)
    else
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    redirect_to root_path
  end

  private
  
  def goal_params
    params.require(:goal).permit(:target, :reason, :time).merge(user_id: current_user.id, achievement: 0, like: 0)
  end

end
