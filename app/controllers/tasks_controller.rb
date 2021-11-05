class TasksController < ApplicationController

  before_action :move_to_root
  before_action :authenticate_user!

  def index
    @goal = Goal.find(params[:goal_id])
    @tasks = @goal.tasks.order('created_at DESC')
    @task = Task.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @tasks = @goal.tasks.order('created_at DESC')
    @task = Task.new(task_params)
    if @task.save
      redirect_to goal_tasks_path(params[:goal_id])
    else
      render :index
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to goal_tasks_path(task.goal.id)
  end

  private

  def task_params
    params.require(:task).permit(:content).merge(goal_id: params[:goal_id])
  end

  def move_to_root
    if current_user.goals.where(id: params[:goal_id]) == []
      redirect_to root_path
    end
  end

end
