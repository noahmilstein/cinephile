class Api::VotesController < ApiController

  def show
    @review = Review.find(params[:review_id])
    upvotes = 0
    downvotes = 0
    @review.votes.each do |vote|
      upvotes += vote.upvote
      downvotes += vote.downvote
    end

    json = {"upvotes": upvotes, "downvotes": downvotes }

    respond_to do |format|
      format.json { render json: json, status: 201 }
    end
  end

  def upvote
    respond_to :json
    @review = Review.find(params[:vote_review_id])
    @review_vote = Vote.find_by(user: current_user, review: @review)
    if @review.user_id == current_user.id
      @error = "You can't vote on your review!"
    elsif @review_vote.nil?
      @review.votes.create(user: current_user, review: @review, upvote: 1, downvote: 0)
    elsif @review_vote.downvote == 1
      @review_vote.update_attributes(downvote: 0)
      @review_vote.update_attributes(upvote: 1)
    elsif @review_vote.upvote == 1
      @review_vote.update_attributes(upvote: 0)
    else
      @review_vote.update_attributes(upvote: 1)
    end
    upvotes = 0
    downvotes = 0
    @review.votes.each do |vote|
      upvotes += vote.upvote
      downvotes += vote.downvote
    end
    json = { "upvotes": upvotes, "downvotes": downvotes }

    respond_to do |format|
      format.json { render json: json, status: 201 }
    end
  end

  def downvote
    respond_to :json
    @review = Review.find(params[:vote_review_id])
    @review_vote = Vote.find_by(user: current_user, review: @review)
    if @review.user_id == current_user.id
      @error = "You can't vote on your review!"
    elsif @review_vote.nil?
      @review.votes.create(user: current_user, review: @review, upvote: 0, downvote: 1)
    elsif @review_vote.upvote == 1
      @review_vote.update_attributes(downvote: 1)
      @review_vote.update_attributes(upvote: 0)
    elsif @review_vote.downvote == 1
      @review_vote.update_attributes(downvote: 0)
    else
      @review_vote.update_attributes(downvote: 1)
    end
    upvotes = 0
    downvotes = 0
    @review.votes.each do |vote|
      upvotes += vote.upvote
      downvotes += vote.downvote
    end
    json = { "upvotes": upvotes, "downvotes": downvotes }

    respond_to do |format|
      format.json { render json: json, status: 201 }
    end
  end

end
