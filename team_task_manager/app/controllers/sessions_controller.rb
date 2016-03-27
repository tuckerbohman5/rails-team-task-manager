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
      @error = "Invalid Login Please Try Again"
      render :new
      end
   
    else 
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
      end
      
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path

    end
  end 

  def auth
    request.env['omniauth.auth']
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