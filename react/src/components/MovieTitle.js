import React from 'react'

let MovieTitle = props => {
  // console.log(props)
  let page = "";
  let movie_path = `movies/${props.id}`;
  page =
    <li onClick={props.onClick}>
      {props.data.title}
    </li>;

  return(
    <div>
      {page}
    </div>

  )
}

export default MovieTitle;
