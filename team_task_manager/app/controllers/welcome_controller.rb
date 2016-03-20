class WelcomeController < ApplicationController
  def home
    @users = User.all
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end