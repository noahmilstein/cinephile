import React, { Component } from 'react';

// class UpVoteButton extends Component {
//   constructor(props) {
//     super(props);
//     this.state = {
//       upvotes: 0,
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
//       url: `/api/votes/${id}/upvote`,
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
//         <button onClick={this.handleButtonClick.bind(this, this.props.id)}>Upvote</button>
//         Total Upvotes: {this.state.upvotes}
//       </div>
//     )
//   }
// }

const UpVoteButton = props => {
  return (
    <button onClick={props.onClick}>Upvote</button>
  )
}

export default UpVoteButton;
