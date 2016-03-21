class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    
    if auth.nil?
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to root_path
      else
      render :new
      end
   
    else 
      @user = User.find_or_create_by(email: auth[:info][:email]) 
      @user.save
      binding.pry
      @user.name = auth[:info][:name]
      @user.email = auth[:info][:email]
      session[:user_id] = @user.id
      redirect_to root_path

    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private 
     def auth
      request.env['omniauth.auth']
    end

end