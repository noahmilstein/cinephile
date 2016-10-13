class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user_movies = @user.movies
    @user_reviews = @user.reviews
  end

  def archive_user
    if current_user.admin
      @user = User.find(params[:format])
    else
      @user = User.find(current_user)
    end

    if @user.movies.empty?
      @user.destroy
      if current_user.admin
        flash[:notice] = "User Deleted!"
        redirect_to users_path
      else
        flash[:notice] = "Bye! Your account has been successfully cancelled.  We hope to see you again soon."
        redirect_to root_path
      end
    else
      timestamp = Time.new
      @user.update_attributes(email: "#{timestamp.to_i}@example.com", username: "#{timestamp}", password: "#{timestamp}" )
      @user.save
      if current_user.admin
        flash[:notice] = "User Deleted."
        redirect_to users_path
      else
        flash[:notice] = "Bye! Your account has been successfully cancelled.  We hope to see you again soon."
        redirect_to root_path
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    binding.pry
    if @user.movies.empty?
      @user.destroy
      flash[:notice] = "User Deleted!"
      redirect_to users_path
    else
      timestamp = Time.new
      @user.update_attributes(email: "#{timestamp}@example.com", username: "#{timestamp}" )
      @user.save
      flash[:notice] = "User Deleted!"
      destroy_user_session_path
    end
  end
end
