class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User Deleted!"
    redirect_to users_path
  end
end
