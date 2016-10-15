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
    $.ajax({
      url: `/api/votes/${id}`,
      contentType: 'application/json',
      success: function(data) {
        this.setState({ upvotes: data.upvotes })
        this.setState({ downvotes: data.downvotes })
      }.bind(this)
    });
  }

  componentDidMount() {
    this.getVotes(this.props.id);
  }

  handleButtonClick(id) {
    debugger;
    event.preventDefault();
    let path = "";
    if (id.includes("upvote_")) {
      path = `/api/votes/${this.props.id}/upvote`
    } else {
      path = `/api/votes/${this.props.id}/downvote`
    }
    debugger;
    $.ajax({
      url: path,
      dataType: 'json',
      method: 'POST',
      success: function(data) {
        this.setState({ upvotes: data.upvotes })
        this.setState({ downvotes: data.downvotes })
      }.bind(this),
      error: function(data) {
        console.log(data);
      }
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
        />
      </div>
    )
  }
}

export default VotingPanel;
