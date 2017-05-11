$(document).ready(function() {
  if (document.location.pathname == "/cocktails") {
    $('.navbar-wagon').css('opacity', 0);
    $(window).on("scroll", function(event) {
      var verticalPosition = $(window).scrollTop();
      if(verticalPosition  > 400) {
        $('.navbar-wagon').css('opacity', 1);
      }
      if(verticalPosition  <= 400) {
        $('.navbar-wagon').css('opacity', 0);
      }
    });
  }
});


