// this is from PR#32 on bootstrap-select-rails
// once it gets merged we will no longer need this file
$(document).on('turbolinks:load', function() {
   $(window).trigger('load.bs.select.data-api');
});