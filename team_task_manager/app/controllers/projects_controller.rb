class ProjectsController < ApplicationController
  def index
  end

  def show
    find_project
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
    find_project
  end

  def update
    find_project
    @project.update(project_params)
    @project.save
    redirect_to project_path(@project)
  end

  def destroy
    find_project
    @project.destroy
    redirect_to root_path
  end

  private 
    def project_params
      params.require(:project).permit(:name, :description, :due_date)
    end

    def find_project
      @project = Project.find(params[:id])
    end
end