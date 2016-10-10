import React, { Component } from 'react';
import MoviesList from './MoviesList'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      intervalId: null,
      movies: []
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

  componentDidMount() {
    this.getMovies();
    let intervalId = setInterval(function() {
      this.getMovies();
    }.bind(this), 2000);
    this.setState({ intervalId: intervalId });
  }

  componentWillUnmount() {
    clearInterval(this.state.intervalId);
  }

  handleMovieClick(id) {
    this.getMovie(id);
  }

  navigate() {
    // this.props.history.pushState(null, "/");
  }

  render() {
    return(
      <div>
        <h1>Welcome to Cinephile!</h1>
        <p>Your source for movie reviews!</p>

        <MoviesList
          data={this.state.movies}
        />
      </div>
    );
  }
}

export default App;
