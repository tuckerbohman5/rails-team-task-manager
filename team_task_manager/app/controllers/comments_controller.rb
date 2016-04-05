class CommentsController < ApplicationController
  def new
  end

  def create

    @comment = Comment.new(comment_params)
    @comment.save
    @user = current_user
    @project = Project.find_by(id: comment_params[:project_id])
    
    @project.comments << @comment
    @project.save
    @user.comments << @comment
    @user.save
    render json: @comment, status: 201
    #redirect_to project_path(@project)
  end

  def show
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :project_id)
    end
end