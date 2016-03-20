class TasksController < ApplicationController
  def new
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

  private
    def task_params
      params.require(:task).permit(:description)
    end
end