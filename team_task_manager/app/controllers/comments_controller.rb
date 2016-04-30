class CommentsController < ApplicationController

  def index
    @project = Project.find(params[:project_id]).includes(:comments)
    @comments = @project.comments # Will not trigger more SQL
    render :json @comments
  end

  def new
  end

  def create
    @project = Project.find_by(id: params[:comment][:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    # @comment = Comment.new(comment_params)
    # @user = current_user
    # @project = 
    
    # @project.comments << @comment
    # @project.save
    # @user.comments << @comment
    # @user.save
    
    if @comment.save
    
      render json: @comment, status: 201
    else
      render # some sort of error json
    end

    #redirect_to project_path(@project)
  end

  def show
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end