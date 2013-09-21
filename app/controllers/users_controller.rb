class UsersController < ApplicationController
before_filter :authenticate_user!

  def new
  end
  
   def portfolio
    @user = User.find(params[:id])
    @projects = @user.projects
    render 'show_follow'
  end
end
