$(document).on('turbolinks:load', function() {
  // Redirect back to home if logged in through swipe id
  /*if ($('#logged-in-through-swipe-id').length) {
    var timer = setTimeout(function() {
      var origin = location.protocol + '//' + location.hostname + (location.port ? ':' + location.port : '');
      window.location.replace(origin + '/home');
    }, 20000);
  }*/
});