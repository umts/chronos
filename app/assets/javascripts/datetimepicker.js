$( document ).on("turbolinks:load", function() {
  $( ".datepicker" ).datetimepicker({
    format: 'YYYY-MM-DD',
  });

  $( ".timepicker" ).datetimepicker({
    format: 'h:mm A'
  });
});