import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      movies: []
    }
  }

  componentDidMount() {
    $.ajax({
      url: '/movies.json',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ movies: data.movies });
    });
  }

  render() {
    let movies = "";
    if (this.state.movies.length !== 0) {
      movies = this.state.movies.map(movie => {
        let movie_url = `/movies/${movie.id}`;
        return(
          <li key={movie.id}>
            <a href={movie_url}>{movie.title}</a>
          </li>
        )
      });
    }
    return(
      <ul>
        {movies}
      </ul>
    );
  }
}

export default App;
