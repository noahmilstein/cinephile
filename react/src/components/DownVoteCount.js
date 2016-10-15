import React, { Component } from 'react';

const DownVoteCount = props => {
  return (
    <span onLoad={props.onLoad}> Downvote Count: {props.count} </span>
  )
}

export default DownVoteCount;
