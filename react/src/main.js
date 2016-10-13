import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

if ($('#div').selector.length > 0) {
  $(function() {
    ReactDOM.render(
      <App />,
      document.getElementById('app')
    );
  });
}


$(document).ready(function() {
  $('.erb-display').hide();
})
