import React, { Component } from 'react';
import MoviesList from './MoviesList'
import Movie from './Movie'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      intervalId: null,
      movies: [],
      selectedMovie: null,
      selectedReviews: []
    }
    this.handleMovieClick = this.handleMovieClick.bind(this)
  }

  getMovies() {
    $.ajax({
      url: '/api/movies',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ movies: data.movies });
    });
  }

  getMovie(id) {
    $.ajax({
      url: `/api/movies/${id}`,
      contentType: 'application/json'
    })
    .done(data => {
      debugger;
      this.setState({ selectedMovie: data.movie });
      this.setState({ selectedReviews: data.reviews })
    });
  }

  componentDidMount() {
    this.getMovies();
    let intervalId = setInterval(function() {
      this.getMovies();
    }.bind(this), 2000);
    this.setState({ intervalId: intervalId });
  }

  handleMovieClick(id) {
    this.getMovie(id);
  }

  render() {
    let page = "";
    if (this.state.selectedMovie != null) {
      page = <Movie
        movieData={this.state.selectedMovie}
        reviewsData={this.state.selectedReviews}
        />;
    } else {
      page = <div>
        <h1>Welcome to Cinephile!</h1>
        <p>Your source for movie reviews!</p>

        <p>React:</p>
        <MoviesList
          data={this.state.movies}
          handleMovieClick={this.handleMovieClick}
          showPage={this.state.selectedMovie}
        />
      </div>
    }

    return(
      <div>
        {page}
      </div>
    );
  }
}

export default App;
