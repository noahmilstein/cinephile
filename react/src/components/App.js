import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }

  componentDidMount() {
    $.ajax({
      url: '/api/movies',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({  });
    });
  }

  render() {
    return(

    );
  }
}

export default App;
