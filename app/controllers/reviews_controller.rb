class ReviewsController < ApplicationController
  before_action :authorize_user, except: [:index]

  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:movie_id])
    @ratings = Movie::RATINGS
    @review.movie = @movie
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review Submitted!"
      redirect_to movie_path(@movie)
    else
      @errors = @review.errors.full_messages.join(', ')
      flash[:notice] = "Review failed to submit: " + @errors
      render :'movies/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @movie = @review.movie
    @review.update_attributes(review_params)
    if @review.save
      flash[:notice] = "Review successfully updated!"
      redirect_to movie_path(@movie)
    else
      flash[:notice] = "Review was not updated."
      @errors = @review.errors.full_messages.join(", ")
      flash[:alert] = @errors
      render action: 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review Deleted!"
    redirect_to movies_path(params[:movie_id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
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
