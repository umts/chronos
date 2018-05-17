$(document).on('turbolinks:load', function() {
  // Link to new month when new month or year are selected
  $('#requests_month_select_tag,#requests_year_select_tag').change(function() {
    var origin = location.protocol + '//' + location.hostname + (location.port ? ':' + location.port : '');
    var url = origin + '/requests?start_date=' + $('#requests_year_select_tag').val()
      + '-' + $('#requests_month_select_tag').val() + '-01';
    window.location.replace(url);
  });
});
