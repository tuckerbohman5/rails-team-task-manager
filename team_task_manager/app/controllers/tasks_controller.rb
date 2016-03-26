class TasksController < ApplicationController
  def new
    @users = User.all
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create

    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to project_path(@project)
  end

  def show

  end

  def complete
    @task = Task.find_by(id: params[:id])
    @task.update(completed: true)
    
    redirect_to project_path(@task.project)
  end

  private
    def task_params
      params.require(:task).permit(:description, :user_id)
    end
end