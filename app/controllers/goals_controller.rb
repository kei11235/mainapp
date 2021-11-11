class GoalsController < ApplicationController
  
  before_action :move_to_root, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  def index
    @q = Goal.where(time: DateTime.now.ago(5.day)..).ransack(params[:q])
    @results = @q.result(distinct: true).includes(:user, :likes).page(params[:page]).per(10).order('achievement DESC')
    if user_signed_in?
      @goal = current_user.goals.order('created_at DESC')
    end
  end

  def show
    @goal = Goal.find(params[:id])
    @user = @goal.user
    @goals = @user.goals.includes(:user, :likes)
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
    if @goal.update(goal_params2)
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

  def indexlike1
    @likes = current_user.likes.includes(goal: :user).order('created_at DESC')
  end

  def indexlike2
    @goals = current_user.goals.includes(likes: :user)
  end


  private
  
  def goal_params
    params.require(:goal).permit(:target, :reason, :time).merge(user_id: current_user.id, achievement: 0, like: 0)
  end

  def goal_params2
    params.require(:goal).permit(:target, :reason, :time)
  end
  
  def move_to_root
    if current_user.goals.where(id: params[:id]) == []
      redirect_to root_path
    end
  end

end