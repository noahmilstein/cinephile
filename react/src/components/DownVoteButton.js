import React, { Component } from 'react';

// class DownVoteButton extends Component {
//   constructor(props) {
//     super(props);
//     this.state = {
//       upvotes: 0,
//       downvotes: 0
//     }
//     // this.handleButtonClick = this.handleButtonClick.bind(this);
//   }
//
//   getVotes(id) {
//     $.ajax({
//       url: `/api/votes/${id}`,
//       contentType: 'application/json'
//     })
//     .done(data => {
//       this.setState({ upvotes: data.upvotes })
//       this.setState({ downvotes: data.downvotes })
//     });
//   }
//
//   componentDidMount() {
//     this.getVotes(this.props.id);
//   }
//
//   handleButtonClick(id) {
//     event.preventDefault();
//
//     $.ajax({
//       url: `/api/votes/${id}/downvote`,
//       contentType: 'application/json',
//       method: 'POST',
//
//       success: function(data) {
//         this.getVotes(this.props.id)
//       }.bind(this)
//     });
//   }
//
//   render() {
//
//     return(
//       <div>
//         <button onClick={this.handleButtonClick.bind(this, this.props.id)}>Downvote</button>
//         Total Downvotes: {this.state.downvotes}
//       </div>
//     )
//   }
// }

const DownVoteButton = props => {
  return (
    <button onClick={props.onClick}>Downvote</button>
  )
}

export default DownVoteButton;
