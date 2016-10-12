import React from 'react';

const NewReviewTitle = props => {
  return(
    <div>
      Title:
      <input
        value={props.newReviewTitle}
        onChange={props.handleTitleChange}
      />
    </div>

  )
}

export default NewReviewTitle;
