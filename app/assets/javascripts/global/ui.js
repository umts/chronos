//Append the 'required' class to any element with a required field in it so that css can prepend an asterisk to it
$(function(){
  $("[required]").each(function(index, element){
    $(element).parent().addClass("required");
    $(element).parents("form").addClass("with-required");
  });
});