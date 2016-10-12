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
    # upvotes = @review.votes.select{|vote| vote.upvote == 1}.count
    upvotes = @review.votes.inject(0) { |upvotes, vote| upvotes += 1 if vote.upvote == 1 }.to_i
    downvotes = @review.votes.inject(0) { |downvotes, vote| downvotes += 1 if vote.downvote == 1 }.to_i
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => { upvotes: upvotes ,downvotes: downvotes, id: @review.id} }
      format.js
    end
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
    # redirect_to movie_path(@review.movie)
    upvotes = @review.votes.inject(0) { |upvotes, vote| upvotes += 1 if vote.upvote == 1 }.to_i
    downvotes = @review.votes.inject(0) { |downvotes, vote| downvotes += 1 if vote.downvote == 1 }.to_i
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => { upvotes: upvotes, downvotes: downvotes , id: @review.id} }
      format.js
    end
  end
end
