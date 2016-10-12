import React from 'react';

const NewReviewRating = props => {
  return(
    <div>
      Rating:
      <select
         defaultValue={props.newReviewRating}
         onChange={props.handleRatingChange}
         >
        <option disabled selected value> -- select rating -- </option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>

    </div>
  )
}

export default NewReviewRating;
