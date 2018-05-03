//Append the 'required' class to any element with a required field in it so that css can prepend an asterisk to it
$( document ).on("turbolinks:load", function() {
  $("[required]").each(function(index, element){
    if ($(element).parent().is(".timepicker, .datepicker, .datetimepicker")) {
      $(element).parent().parent().addClass("required");
    } else {
      $(element).parent().addClass("required");
    }
    $(element).parents("form").addClass("with-required");
  });
});
