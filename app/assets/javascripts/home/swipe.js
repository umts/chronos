$(document).on('turbolinks:load', function() {
  function updateClock() {
    var now = new Date();
    $('#home-swipe-clock-date').html(now.toLocaleString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' }));
    $('#home-swipe-clock-time').html(now.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', second: 'numeric' }));
    timer = setTimeout(function() {
      updateClock();
    }, 500);
  }
  updateClock();
});