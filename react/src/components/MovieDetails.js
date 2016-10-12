import React, { Component } from 'react';
import { Link } from 'react-router';
import MovieReview from './MovieReview'
import UpVoteButton from './UpVoteButton'
import DownVoteButton from './DownVoteButton'
import VotingPanel from './VotingPanel'

class MovieDetails extends Component {
  constructor(props) {
    super(props);
    this.state = {
      movie: null,
      reviews: [],
      newReviewTitle: "",
      newReviewBody: "",
      newReviewRating: null
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.handleTitleChange = this.handleTitleChange.bind(this)
    this.handleBodyChange = this.handleBodyChange.bind(this)
    this.handleRatingChange = this.handleRatingChange.bind(this)
  }

  handleFormSubmit(event) {
    event.preventDefault();
    let reviewPost;
    let response;
    let lastReviewId;

    if (this.state.newReviewBody.length > 50) {  //Prevent blank submission
      reviewPost = JSON.stringify({ movie_id: this.state.movie.id, title: this.state.newReviewTitle, body: this.state.newReviewBody, rating: this.state.newReviewRating });
      $.ajax({
        url: '/api/reviews',
        contentType: 'application/json',
        method: 'POST',
        data: reviewPost,
        success: function(data) {
          let newReview = {
            id: data.review.id,
            title: this.state.newReviewTitle,
            body: this.state.newReviewBody,
            rating: this.state.newReviewRating
          };
          let newReviews = [...this.state.reviews, newReview];
          this.setState({
            reviews: newReviews,
            newReviewTitle: '',
            newReviewBody: '',
            newReviewRating: null
          });
        }.bind(this)
      });
    }
  }

  handleTitleChange(event) {
    let newTitle = event.target.value;
    this.setState({ newReviewTitle: newTitle });
  }

  handleBodyChange(event) {
    let newBody = event.target.value;
    this.setState({ newReviewBody: newBody });
  }

  handleRatingChange(event) {
    let newRating = event.target.value;
    this.setState({ newReviewRating: newRating });
  }

  getMovie(id) {
    $.ajax({
      url: `/api/movies/${id}`,
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ movie: data.movie })
      this.setState({ reviews: data.reviews })
    });
  }

  componentDidMount() {
    this.getMovie(this.props.params.movie);
  }

  render() {

    let page = "";
    let upVoteKey = "";
    let downVoteKey = "";
    let votingPanelKey = "";
    let reviews = this.state.reviews.map(review => {
      upVoteKey = `upvote_${review.id}`
      downVoteKey = `downvote_${review.id}`
      votingPanelKey = `votingPanel_${review.id}`
      return(
        <div key={review.id}>
          <p>
            Title: {review.title}
          </p>
          <p>
            Body: {review.body}
          </p>
          <p>
            Rating: {review.rating}
          </p>
            <VotingPanel
              key={votingPanelKey}
              id={review.id}
            />
        </div>
      )
    })
    if (this.state.movie === null) {
      page = ""
    } else {
      page =
      <div>
        <Link to="/">Back to Index</Link>
        <h2>{this.state.movie.title}</h2>
        <p>Studio: {this.state.movie.studio}</p>
        <p>Year: {this.state.movie.year}</p>
        <p>Rating: {this.state.movie.rating}</p>
        <p>Genre: {this.state.movie.genre}</p>
        <p>Cast: {this.state.movie.cast}</p>
        <p>Screen Writer: {this.state.movie.screen_writer}</p>
        <p>Director: {this.state.movie.director}</p>
        <h2>Write Review:</h2>
        <MovieReview
          newReviewTitle={this.state.newReviewTitle}
          newReviewBody={this.state.newReviewBody}
          newReviewRating={this.state.newReviewRating}
          handleTitleChange={this.handleTitleChange}
          handleBodyChange={this.handleBodyChange}
          handleRatingChange={this.handleRatingChange}
          />
        <button onClick={this.handleFormSubmit}>Submit</button>

        <h2>Reviews:</h2>
        {reviews}
        <p><Link to="/">Back to Index</Link></p>
      </div>
    }

    return(
      <div>
        {page}
      </div>
    )
  }
}

export default MovieDetails;
