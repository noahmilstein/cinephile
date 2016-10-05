class ReviewsController < ApplicationController
  before_action :authorize_user, except: [:index]

  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:movie_id]) # testing this line
    if @review.save
      flash[:notice] = "Review Submitted!"
      redirect_to movie_path(@movie)
      # render :'movies/show'
    else
      flash[:notice] = "Review failed to submit"
      render :'movies/show'
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

  def review_params
    params.require(:review).permit(
      :title,
      :body,
      :rating
    )
  end
end
