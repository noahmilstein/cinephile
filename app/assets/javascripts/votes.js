// $(document).ready(function() {
//   alert('it works!');
// });

$(function(){
  $("#upvote").bind('ajax:complete', function() {
    alert('it works!');
  });
});

// $(document).ready(function(){
  $('.upvote').on('click', function(event) {
    debugger;
    event.preventDefault();
    let upvote = this.href; //current path
    var request = $.ajax({
      method: "POST",
      url: `${upvote}.json`
    });

    request.done(function(data) {
      $('#upvote-count').replaceWith(`${data.upvotes}`);
    });
  });
// });

// $('#upvote').on('click', function(event) {
//     event.preventDefault();
//     var upvote = this.href
//     // debugger;
//
//     var request = $.ajax({
//       method: "GET",
//       url: `${upvote}.json`
//     });
//
//     request.done(function(data) {
//       $('#upvote-count').replaceWith(`${data.upvotes} Upvotes`);
//       $('#downvote-count').replaceWith(`${data.downvotes} Downvotes`);
//     });
//
//
//   });
