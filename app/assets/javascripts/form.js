$(document).on('turbolinks:load', function() {
  $('.datetimepicker').datetimepicker();

  $('.datepicker').datetimepicker({
    format: 'YYYY-MM-DD',
    showTodayButton: true,
    showClear: true,
    showClose: true
  });

  $('.timepicker').datetimepicker({
    format: 'h:mm A'
  });
});
