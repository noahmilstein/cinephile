class Api::MoviesController < ApiController
  def index
    movies = Movie.all

    json = { "movies": movies }

    respond_to do |format|
      format.json { render json: json }
    end
  end

  def show
    movie = Movie.find(params[:id])
    reviews = movie.reviews
    json = { "movie": movie, "reviews": reviews }

    respond_to do |format|
      format.json { render json: json }
    end
  end
end
