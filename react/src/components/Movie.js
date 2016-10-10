import React from 'react'

let Movie = props => {
  let page = "";
  let movie_path = `movies/${props.id}`;
  if (props.showPage == props.id) {
    let reviews = props.reviewsData.map(review => {
      return(
        <li>
          <p>
            {review.title}
          </p>
          <p>
            {review.body}
          </p>
        </li>
      )
    })
    page =
    <div>
      <li>
        <p>{props.movieData.title}</p>
        <p>{props.movieData.studio}</p>
        <p>{props.movieData.year}</p>
        <p>{props.movieData.rating}</p>
        <p>{props.movieData.genre}</p>
        <p>{props.movieData.cast}</p>
        <p>{props.movieData.screen_writer}</p>
        <p>{props.movieData.director}</p>
        {reviews}
      </li>;
    </div>
  } else {
    page =
      <li onClick={props.onClick}>
        {props.data.title}
      </li>;
  }
  return(
    <div>
      {page}
    </div>

  )
}

export default Movie;
