$( document ).on("turbolinks:load", function() {
  $( ".datepicker" ).datetimepicker({
    format: 'YYYY-MM-DD',
  });

  $( ".timepicker" ).datetimepicker({
    format: 'h:mm A'
  });

  $( ".datetimepicker" ).datetimepicker({
    format: 'YYY-MM-DD h:mm A',
    sideBySide: true
  });
});