class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(params[:task])
    flash[:notice] = "Your task has been added."
    redirect_to :root
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Your task has been deleted."
    redirect_to :root
  end
end
