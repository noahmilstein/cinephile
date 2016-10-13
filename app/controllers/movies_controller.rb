class MoviesController < ApplicationController
  before_action :authorize_user, except: [:index]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].nil?
      @movies = Movie.all.order(:title)
    elsif params[:search].strip.length.zero?
      @movies = []
    elsif params[:search]
      final_search = params[:search].split.map(&:capitalize).join(' ')
      @movies = Movie.search(final_search).order(:title)
    end

    movies_json = { "movies": @movies }
    respond_to do |format|
      format.html
      format.json { render json: movies_json }
    end
  end

  def show
    @review = Review.new
    @ratings = Movie::RATINGS
    @movie = Movie.find(params[:id])
    @user = current_user
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.new
  end

  def edit
    if current_user.admin
      @movie = Movie.find(params[:id])
    else
      flash[:notice] = "Access Denied."
      redirect_to movie_path(@movie)
    end
  end

  def update
    @movie.update_attributes(movie_params)
    if @movie.save
      flash[:notice] = "Movie Updated!"
      redirect_to @movie
    else
      @errors = @movie.errors.full_messages.join(", ")
      flash[:alert] = "Movie Not Updated!"
      flash[:notice] = @errors
      render :edit
    end
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      @movie.title = @movie.title.split.map(&:capitalize).join(' ')
      @movie.studio = @movie.studio.split.map(&:capitalize).join(' ')
      @movie.rating = @movie.rating.split.map(&:capitalize).join(' ')
      @movie.genre = @movie.genre.split.map(&:capitalize).join(' ')
      @movie.cast_member = @movie.cast_member.split.map(&:capitalize).join(' ')
      @movie.screen_writer = @movie.screen_writer.split.map(&:capitalize).join(' ')
      @movie.director = @movie.director.split.map(&:capitalize).join(' ')
      @movie.save
      redirect_to movie_path(@movie)
      flash[:notice] = "You successfully added a movie"
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie Deleted!"
    redirect_to movies_path
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

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(
      :title,
      :studio,
      :year,
      :rating,
      :genre,
      :cast_member,
      :director,
      :screen_writer,
      :user,
      :poster,
      :remote_poster_url
    )
  end
end
