import React from 'react'
import Movie from './Movie'

let MoviesList = props => {

  let movies = props.data.map(movie => {
    return(
      <Movie
        key={movie.id}
        id={movie.id}
        title={movie.title}
        studio={movie.studio}
        year={movie.year}
        rating={movie.rating}
        genre={movie.genre}
        cast={movie.cast}
        director={movie.director}
        screenWriter={movie.screen_writer}
      />
    )
  });

  return(
    <ul>
      {movies}
    </ul>
  )
}

export default MoviesList;
