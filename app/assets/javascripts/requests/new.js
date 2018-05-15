$(document).on('turbolinks:load', function() {
  var checkbox_input = $('form#new_request .form-group div #request_time_by_shifts');
  // Toggle fields initially if checkbox is present
  if (checkbox_input.length) {
    request_new_toggle_time_fields(checkbox_input);
  }
  // Toggle fields when checkbox is clicked
  checkbox_input.click(function() {
    request_new_toggle_time_fields(checkbox_input);
  });
});

function request_new_toggle_time_fields(checkbox_input) {
  var time_fields = $('#request_start_time,#request_end_time');
  if (checkbox_input.prop('checked')) {
    time_fields.prop('disabled', true);
    time_fields.parent().parent().removeClass('required');
  } else {
    time_fields.prop('disabled', false).prop('required', true);
    time_fields.parent().parent().addClass('required');
  }
};
