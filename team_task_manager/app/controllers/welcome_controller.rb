class WelcomeController < ApplicationController
  def home
    @projects = Project.all
    @user = current_user
  end
end