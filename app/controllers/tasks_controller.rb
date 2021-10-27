class TasksController < ApplicationController

def index
  @goal = Goal.find(params[:goal_id])
  @tasks = @goal.tasks
  @task = Task.new
  @completion = @goal.completions.order('created_at DESC')
end

def create
  task = Task.create(task_params)
  # render json:{ task: task }
  redirect_to goal_tasks_path(params[:goal_id])
end

def show
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

end
