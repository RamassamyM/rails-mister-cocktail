$(document).ready(function() {
  if (document.location.pathname == "/cocktails") {
    // $('.navbar-wagon').css('opacity', 0);
    $('.navbar-wagon').hide();
    $(window).on("scroll", function(event) {
      var verticalPosition = $(window).scrollTop();
      if(verticalPosition  > 400) {
        // $('.navbar-wagon').css('opacity', 1);
        $('.navbar-wagon').show();
      }
      if(verticalPosition  <= 400) {
        // $('.navbar-wagon').css('opacity', 0);
        $('.navbar-wagon').hide();
      }
    });
    // if ($('.navbar-wagon').css('opacity') == 0) {
    //   $('.navbar-wagon').hide();
    // }
    // if ($('.navbar-wagon').css('opacity') > 0) {
    //   $('.navbar-wagon').show();
    // }
  }
});


