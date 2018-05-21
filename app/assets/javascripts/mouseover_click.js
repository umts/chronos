/*$(document).on('turbolinks:load', function() {
  //$('a.dropdown-toggle').hover(function() {
  //  $(this).dropdown('toggle');
  //});

  // Prevent clicking of same link infinite times
  var auto_click = false;
  $(document).mousemove(function(e) {
    auto_click = true;
  });

  // Auto click links with mouseover-button class
  $('a').mouseover(function() {
    if (auto_click) {
      window.location.href = $(this).attr('href');
    }
  });

  $('form').find('input').mouseover(function() {
    if (auto_click) {
      $(this).click();
    }
  })
});
*/