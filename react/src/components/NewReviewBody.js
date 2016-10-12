import React from 'react';

const NewReviewBody = props => {
  return(
    <div>
      Body:
      <input
        value={props.newReviewBody}
        onChange={props.handleBodyChange}
      />
    </div>

  )
}

export default NewReviewBody;
