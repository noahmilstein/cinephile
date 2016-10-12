import React from 'react';
import NewReviewTitle from './NewReviewTitle'
import NewReviewBody from './NewReviewBody'
import NewReviewRating from './NewReviewRating'

const MovieReview = props => {
  return (
    <div>
      <NewReviewTitle
        title={props.newReviewTitle}
        handleTitleChange={props.handleTitleChange}
      />
      <NewReviewBody
        body={props.newReviewBody}
        handleBodyChange={props.handleBodyChange}
      />
      <NewReviewRating
        rating={props.newReviewRating}
        handleRatingChange={props.handleRatingChange}
      />
    </div>
  )
}

export default MovieReview;
