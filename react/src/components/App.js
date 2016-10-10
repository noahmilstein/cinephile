import React, { Component } from 'react';
import MoviesList from './MoviesList'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      intervalId: null,
      movies: []
    }
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

  render() {
    return(
      <MoviesList data={this.state.movies}/>
    );
  }
}

export default App;
