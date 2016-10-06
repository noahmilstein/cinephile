class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    @review.user = current_user

    if @review.save
      flash[:notice] = "Review Submitted!"
      redirect_to movie_path(@movie)
    else
      @errors = @review.errors.full_messages.join(", ")
      flash[:alert] = "Review failed to submit"
      flash[:notice] = @errors

      redirect_to movie_path(@movie)
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
end
