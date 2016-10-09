import React from 'react'

let Movie = props => {
  let movie_path = `movies/${props.id}`;
  return(
    <li>
      <a href={movie_path}>{props.title}</a>
    </li>
  )
}

export default Movie;
