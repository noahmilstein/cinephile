import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      movies: [],
      admin: false,
      intervalId: null
    }
    this.handleButtonClick = this.handleButtonClick.bind(this)
  }

  handleButtonClick(id) {
    $.ajax({
      url: `/movies/${id}`,
      method: 'delete'
    })
    .done(data => {
    });
    this.getMovies();
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
      this.getMovies()
    }.bind(this), 2000);
    this.setState({ intervalId: intervalId });
  }

  componentWillUnMount() {
    clearInterval(this.state.intervalId);
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
      <div className="movie-show">
        {movies}
      </div>
    );
  }
}

export default App;

// <div class="erb-display">
//   <% @movies.each_with_index do |movie, index| %>
//     <div class="row callout">
//       <p class="small-2 columns"><%= image_tag movie.poster %></p>
//       <p class="small-3 columns"><%= link_to movie.title, movie_path(movie) %></p>
//       <p class="small-7 columns"></p>
      // <% unless current_user.nil? %>
      //   <% if current_user.admin %>
      //     <p><%= link_to "Delete Movie", movie_path(movie), method: :delete, id: "delete #{index + 1}" %></p>
      //   <% end %>
      // <% end %>
//     </div>
//   <% end %>
// </div>
