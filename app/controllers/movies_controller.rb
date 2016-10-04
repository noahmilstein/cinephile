class MoviesController < ApplicationController
  before_action :authorize_user, except: [:index]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
      flash[:notice] = "You successfully added a movie"
    else
      render :new
    end
  end

  protected

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in or sign up in"\
      " order to view this movie and its reviews"
      redirect_to root_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title,
      :studio,
      :year,
      :rating,
      :genre,
      :cast,
      :director,
      :screen_writer
    )
  end
end
