class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(params[:task])
    flash[:notice] = "Your task has been added."
    redirect_to :root
  end

  def delete(task)
    task.destroy
    flash[:notice] = "Your Task has been deleted."
    redirect_to :root
  end

  def delete_all
    @tasks = Task.all
    @tasks.each do |task|
      task.destroy
    end
    flash[:notice] = "Your Task has been deleted." unless !Task.all == nil
    redirect_to :root
  end
end
