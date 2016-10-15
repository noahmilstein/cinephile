import React, { Component } from 'react';

const DownVoteButton = props => {
  return (
    <button className="button" onClick={props.onClick}>Downvote</button>
  )
}

export default DownVoteButton;
