import React from 'react';
import { Link } from 'react-router';
import MovieTitle from './MovieTitle';
import MovieDetails from './MovieDetails';

let MoviesList = props => {

  let movies = props.data.map(movie => {

    let onClick = () => props.handleMovieClick(movie.id);

    return(
      <Link to={"/movies/"+movie.id} key={movie.id}>
        <MovieTitle
          key={movie.id}
          id={movie.id}
          data={movie}
        />
      </Link>
    )
  });

  return(
    <div>
      <ul>
        {movies}
      </ul>
    </div>
  )
}

export default MoviesList;
