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
      # yours users

      #   id           uid
      #   1            4515


      # facebook users tabe
      #   id
      #   4515

      @user = User.find_or_create_by(facebook_uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex
      end
      
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