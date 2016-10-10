import React, { Component } from 'react';
import { Link } from 'react-router';

class MovieDetails extends Component {
  constructor(props) {
    super(props);
    this.state = {
      movie: null,
      reviews: []
    }
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
    let reviews = this.state.reviews.map(review => {
      return(
        <div key={review.id}>
          <p>
            {review.title}
          </p>
          <p>
            {review.body}
          </p>
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
        <br></br>
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
