class ProjectsController < ApplicationController
  def index
  end

  def show
    find_project
    @comment = Comment.new
  end

  def new
    @users = User.all
    @project = Project.new
    3.times {@project.tasks.build}
  end

  def create
    
    @project = Project.create(project_params)
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

  def complete
    find_project
    @project.update(completed: true)
    redirect_to root_path
  end

  def destroy
    find_project
    @project.destroy
    redirect_to root_path
  end

  private 
    def project_params
      params.require(:project).permit(:name, :description, :due_date, tasks_attributes: [:description, :user_id])
    end

    def find_project
      @project = Project.find(params[:id])
    end
end