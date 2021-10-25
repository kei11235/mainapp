class GoalsController < ApplicationController

  def index
  end

  def new
    @goal = Goal.new
  end

end
