class Api::MoviesController < ApiController
  def index
    movies = Movie.all

    json = { "movies": movies }

    respond_to do |format|
      format.json { render json: json }
    end
  end
end
