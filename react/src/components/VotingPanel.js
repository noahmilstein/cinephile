import React, { Component } from 'react';
import UpVoteButton from './UpVoteButton'
import DownVoteButton from './DownVoteButton'
import UpVoteCount from './UpVoteCount'
import DownVoteCount from './DownVoteCount'

class VotingPanel extends Component {
  constructor(props) {
    super(props);
    this.state = {
      upvotes: 0,
      downvotes: 0
    }
    this.getVotes = this.getVotes.bind(this);
    this.handleButtonClick = this.handleButtonClick.bind(this);
  }

  getVotes(id) {
    debugger;
    $.ajax({
      url: `/api/votes/${id}`,
      contentType: 'application/json',
      success: function(data) {
        debugger;
        this.setState({ upvotes: data.upvotes })
        this.setState({ downvotes: data.downvotes })
      }.bind(this)
    });
  }

  componentDidMount() {
    this.getVotes(this.props.id);
  }

  handleButtonClick(id) {
    event.preventDefault();
    let path = "";
    if (id.includes("upvote_")) {
      path = `/api/votes/${id.replace("upvote_", "")}/upvote`
    } else {
      path = `/api/votes/${id.replace("downvote_", "")}/downvote`
    }
    $.ajax({
      url: path,
      contentType: 'application/json',
      method: 'POST',
      success: function(data) {
        this.getVotes(this.props.id)
      }.bind(this)
    });
  }

  render() {
    let upVoteKey = `upvote_${this.props.id}`;
    let downVoteKey = `downvote_${this.props.id}`;
    let upVoteCountKey = `upvote_count_${this.props.id}`;
    let downVoteCountKey = `downvote_count_${this.props.id}`;
    let upvotes = this.state.upvotes;
    let downvotes = this.state.downvotes;
    // debugger;
    let onUpClick = () => this.handleButtonClick(upVoteKey);
    let onDownClick = () => this.handleButtonClick(downVoteKey);
    let onLoad = () => this.getVotes(this.props.id);
    return(
      <div>
        <UpVoteButton
          key={upVoteKey}
          id={this.props.id}
          onClick={onUpClick}
        />
        <UpVoteCount
          key={upVoteCountKey}
          id={this.props.id}
          count={upvotes}
        />
        <br></br>
        <DownVoteButton
          key={downVoteKey}
          id={this.props.id}
          onClick={onDownClick}
        />
        <DownVoteCount
          key={downVoteCountKey}
          id={this.props.id}
          count={downvotes}
          onLoad={onLoad}
        />
      </div>
    )
  }
}

export default VotingPanel;
