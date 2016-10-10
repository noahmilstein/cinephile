import React from 'react'
import Movie from './Movie'

let MoviesList = props => {

  let movies = props.data.map(movie => {

    let onClick = () => props.handleMovieClick(movie.id);

    return(
      <Movie
        key={movie.id}
        id={movie.id}
        data={movie}
        showPage={props.showPage}
        onClick={onClick}
      />
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
