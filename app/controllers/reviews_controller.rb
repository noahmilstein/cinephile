class ReviewsController < ApplicationController
  before_action :authorize_user, except: [:index]

  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:movie_id])
    binding.pry
    @ratings = Movie::RATINGS
    @review.movie_id = @movie.id
    @user = current_user
    @review.user_id = @user.id
    @review.rating = params[:rating]
    binding.pry
    if @review.save
      flash[:notice] = "Review Submitted!"
      redirect_to movie_path(@movie)
    else
      flash[:notice] = "Review failed to submit"
      @errors = @review.errors.full_messages.join(', ')
      flash[:notice] = @errors
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
      :rating,
      :movie_id,
      :user_id
    )
  end
end
