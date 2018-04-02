$( document ).on("turbolinks:load", function() {
  $( ".datepicker" ).datetimepicker({
    format: 'YYYY-MM-DD',
    showTodayButton: true,
    showClear: true,
    showClose: true
  });

  $( ".timepicker" ).datetimepicker({
    format: 'h:mm A'
  });
});