$(document).ready(function() {
  $(function() {
   var window_height = $(window).height(),
   content_height = window_height - 200;
   $('.mygrid-wrapper-div').height(content_height);
});

$( window ).resize(function() {
   var window_height = $(window).height(),
   content_height = window_height - 200;
   $('.mygrid-wrapper-div').height(content_height);
});
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
