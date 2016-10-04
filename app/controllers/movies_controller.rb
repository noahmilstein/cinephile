class MoviesController < ApplicationController
before_action :authorize_user, except: [:index]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  protected
  def authorize_user
    if !user_signed_in?
      flash[:notice] = "Please sign in or sign up in order to view this movie and its reviews"
      redirect_to root_path
    end
  end

end
