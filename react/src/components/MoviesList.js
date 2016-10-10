import React from 'react';
import { Link } from 'react-router';
import MovieDetails from './MovieDetails';

let MoviesList = props => {

  let movies = props.data.map(movie => {

    return(
      <Link to={"/movies/"+movie.id} key={movie.id}>
        <div>{movie.title}</div>
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
