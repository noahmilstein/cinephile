$(document).ready(function(){

$('.Upvote').on('click', function(event) {
    event.preventDefault();
    let upVote = this.parentElement.action;
    var request = $.ajax({
      method: "POST",
      url: `${upVote}.json`
    });

    request.done(function(data) {
      if (data.error === null) {
        let upCount = `Upvote-sum_${data.id}`;
        let upNewCount = `${data.upvotes}`;
        let downCount = `Downvote-sum_${data.id}`;
        let downNewCount = `${data.downvotes}`;
        document.getElementById(upCount).innerHTML = upNewCount;
        document.getElementById(downCount).innerHTML = downNewCount;
        document.getElementById('error').innerHTML = "";
      }
      else {
        document.getElementById('error').innerHTML = data.error;
      }
    });
  });

  $('.Downvote').on('click', function(event) {
      event.preventDefault();
      let downVote = this.parentElement.action;
      var request = $.ajax({
        method: "POST",
        url: `${downVote}.json`
      });

      request.done(function(data) {
        if (data.error === null) {
          let upCount = `Upvote-sum_${data.id}`;
          let upNewCount = `${data.upvotes}`;
          let downCount = `Downvote-sum_${data.id}`;
          let downNewCount = `${data.downvotes}`;
          document.getElementById(upCount).innerHTML = upNewCount;
          document.getElementById(downCount).innerHTML = downNewCount;
          document.getElementById('error').innerHTML = "";
        }
        else {
          document.getElementById('error').innerHTML = data.error;
        }
      });
    });
});
