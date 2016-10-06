class VotesController < ApplicationController
  def upvote
    @review = Review.find(params[:review_id])
    @user_vote = Vote.find_by(user: current_user)
    if !@user_vote
      @review.votes.create(user: current_user, review: @review, upvote: 1, downvote: 0)
    elsif @user_vote.downvote == 1
      @user_vote.update_attributes(downvote: 0)
      @user_vote.update_attributes(upvote: 1)
    elsif @user_vote.upvote == 1
      @user_vote.update_attributes(upvote: 0)
    else
      @user_vote.update_attributes(upvote: 1)
    end
    redirect_to movie_path(@review.movie)
  end

  def downvote
    @review = Review.find(params[:review_id])
    @user_vote = Vote.find_by(user: current_user)
    if !@user_vote
      @review.votes.create(user: current_user, review: @review, upvote: 0, downvote: 1)
    elsif @user_vote.upvote == 1
      @user_vote.update_attributes(downvote: 1)
      @user_vote.update_attributes(upvote: 0)
    elsif @user_vote.downvote == 1
      @user_vote.update_attributes(downvote: 0)
    else
      @user_vote.update_attributes(downvote: 1)
    end
    redirect_to movie_path(@review.movie)
  end
end
