class CompletionsController < ApplicationController

  def index
    @goal = Goal.find(params[:goal_id])
    @tasks = @goal.tasks
    @task = Task.new
    @completion = @goal.completions.order('created_at DESC')
  end
  
  def create
    task = Task.create(task_params)
    # render json:{ task: task }
    goal = task.goal
    num = ((goal.completions.count / (goal.tasks.count + goal.completions.count  + 0.0001)) * 100).ceil(1)
    goal.update(achievement: num)
    redirect_to goal_completions_path(params[:goal_id])
  end
  
  def show
    task = Task.find(params[:id])
    attri = task.attributes
    Completion.create(content: attri["content"], goal_id: attri["goal_id"])
    task.destroy
    goal = task.goal
    num = ((goal.completions.count / (goal.tasks.count + goal.completions.count  + 0.0001)) * 100).ceil(1)
    goal.update(achievement: num)
    redirect_to goal_completions_path(task.goal.id)
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy
    goal = task.goal
    num = ((goal.completions.count / (goal.tasks.count + goal.completions.count  + 0.0001)) * 100).ceil(1)
    goal.update(achievement: num)
    redirect_to goal_completions_path(task.goal.id)
  end

  def edit
    completion= Completion.find(params[:id])
    completion.destroy
    goal = completion.goal
    num = ((goal.completions.count / (goal.tasks.count + goal.completions.count  + 0.0001)) * 100).ceil(1)
    goal.update(achievement: num)
    redirect_to goal_completions_path(completion.goal.id)
  end

  private
  
  def task_params
    params.require(:task).permit(:content).merge(goal_id: params[:goal_id])
  end

end
