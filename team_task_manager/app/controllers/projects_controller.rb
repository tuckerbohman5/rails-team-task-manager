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
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
    redirect_to project_path(@project)

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
    def project_params
      params.require(:project).permit(:name, :description, :due_date)
    end
end