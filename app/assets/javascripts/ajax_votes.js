$(document).ready(function(){

$('.Upvote').on('click', function(event) {
    event.preventDefault();
    let upvote = this.parentElement.action;
    var request = $.ajax({
      method: "POST",
      url: `${upvote}.json`
    });

    request.done(function(data) {
      if (data.error === null) {
        let upcount = `Upvote-sum_${data.id}`;
        let upnewcount = `${data.upvotes}`;
        let downcount = `Downvote-sum_${data.id}`;
        let downnewcount = `${data.downvotes}`;
        document.getElementById(upcount).innerHTML = upnewcount;
        document.getElementById(downcount).innerHTML = downnewcount;
        document.getElementById('error').innerHTML = "";
      }
      else {
        document.getElementById('error').innerHTML = data.error;
      }
    });
  });

  $('.Downvote').on('click', function(event) {
      event.preventDefault();
      let downvote = this.parentElement.action;
      var request = $.ajax({
        method: "POST",
        url: `${downvote}.json`
      });

      request.done(function(data) {
        if (data.error === null) {
          let upcount = `Upvote-sum_${data.id}`;
          let upnewcount = `${data.upvotes}`;
          let downcount = `Downvote-sum_${data.id}`;
          let downnewcount = `${data.downvotes}`;
          document.getElementById(upcount).innerHTML = upnewcount;
          document.getElementById(downcount).innerHTML = downnewcount;
          document.getElementById('error').innerHTML = "";
        }
        else {
          document.getElementById('error').innerHTML = data.error;
        }
      });
    });
});
