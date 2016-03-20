class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    raise params.inspect
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
end