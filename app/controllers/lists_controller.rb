class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
    @task = Task.new
  end

  def create
    @list = List.create(params[:list])
    flash[:notice] = "Your list has been added."
    redirect_to :root
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "Your list has been deleted."
    redirect_to :root
  end
end