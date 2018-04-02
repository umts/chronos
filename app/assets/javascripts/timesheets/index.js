$( document ).on("turbolinks:load", function() {
  // Set value to start of week and display Start and End of Week
  $('.weekpicker .datepicker').on('dp.change', function() {
    var value = $("#weekpicker").val();
    var date = moment(value, "YYYY-MM-DD").day(0).format("YYYY-MM-DD");
    document.getElementById("weekpicker").value = date;
  })
});
