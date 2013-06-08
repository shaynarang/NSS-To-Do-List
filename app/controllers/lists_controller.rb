class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(params[:list])
    flash[:notice] = "Your list has been added."
    redirect_to :root
  end
end