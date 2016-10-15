import React, { Component } from 'react';
import MoviesList from './MoviesList'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      intervalId: null,
      admin: false,
      movies: []
    }
    this.handleMovieClick = this.handleMovieClick.bind(this)
  }

  getMovies() {
    $.ajax({
      url: '/movies.json',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ movies: data.movies });
      this.setState({ admin: data.admin });
    });
  }

  componentDidMount() {
    this.getMovies()
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
    let movies = "";
    let adminDelete = "";
    if (this.state.movies.length !== 0) {
      movies = this.state.movies.map(movie => {
        let movie_url = `/movies/${movie.id}`;
        let onClick = () => this.handleButtonClick(movie.id);
        if (this.state.admin) {
          adminDelete = <button className="button" onClick={onClick}>Delete</button>
        }
        return(
          <div className="row callout" key={movie.id}>
            <p className="small-2 columns"><img src={movie.poster.url}/></p>
            <p className="small-3 columns"><a href={movie_url}>{movie.title}</a></p>
            <p className="small-5 columns">{adminDelete}</p>
            <p className="small-7 columns"></p>
          </div>
        )
      });
    }
    return(
      <div>
        <h1>Welcome to Cinephile!</h1>
        <p>Your source for movie reviews!</p>

        <MoviesList
          data={this.state.movies}
        />
      <div className="movie-show">
        {movies}
      </div>
    );
  }
}

export default App;
