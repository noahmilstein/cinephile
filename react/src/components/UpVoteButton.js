import React, { Component } from 'react';

const UpVoteButton = props => {
  return (
    <button onClick={props.onClick}>Upvote</button>
  )
}

export default UpVoteButton;
