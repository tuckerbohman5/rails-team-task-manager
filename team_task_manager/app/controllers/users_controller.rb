class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @users }
    end
  end
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end


  private 
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end