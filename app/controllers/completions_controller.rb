class CompletionsController < ApplicationController

  before_action :move_to_root
  before_action :authenticate_user!

  def index
    @goal = Goal.find(params[:goal_id])
    @tasks = @goal.tasks
    @task = Task.new
    @completion = @goal.completions.order('created_at DESC')
  end
  
  def create
    @goal = Goal.find(params[:goal_id])
    @tasks = @goal.tasks
    @completion = @goal.completions.order('created_at DESC')
    @task = Task.new(task_params)
    if @task.save
      num = ((@goal.completions.count / (@goal.tasks.count + @goal.completions.count  + 0.0001)) * 100).ceil(1)
      @goal.update(achievement: num)
      redirect_to goal_completions_path(params[:goal_id])
    else
      render :index
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    goal = task.goal
    num = ((goal.completions.count / (goal.tasks.count + goal.completions.count  + 0.0001)) * 100).ceil(1)
    goal.update(achievement: num)
    redirect_to goal_completions_path(task.goal.id)
  end

  def movedelete
    task = Task.find(params[:id])
    attri = task.attributes
    Completion.create(content: attri["content"], goal_id: attri["goal_id"])
    task.destroy
    goal = task.goal
    num = ((goal.completions.count / (goal.tasks.count + goal.completions.count  + 0.0001)) * 100).ceil(1)
    goal.update(achievement: num)
    redirect_to goal_completions_path(task.goal.id)
  end

  def completiondelete
    completion = Completion.find(params[:id])
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

  def move_to_root
    if current_user.goals.where(id: params[:goal_id]) == []
      redirect_to root_path
    end
  end

end
