$(document).ready(function() {
  var isRootUrl = (window.location.pathname.toLowerCase() === "/");
  var isCocktailIndexUrl = (window.location.pathname.toLowerCase() === "/cocktails");

  if (isRootUrl || isCocktailIndexUrl) {
    $('.navbar-wagon').css('opacity', 0);
    $('.navbar-wagon').hide();
    $(window).on("scroll", function(event) {
      var verticalPosition = $(window).scrollTop();
      if(verticalPosition  > 400) {
        // $('.navbar-wagon').show();
        $('.navbar-wagon').css('opacity', 1);
      }
      if(verticalPosition  <= 400) {
        $('.navbar-wagon').css('opacity', 0);
      }
      if ($('.navbar-wagon').css('opacity') === "0") {
        $('.navbar-wagon').hide();
      }
      else {
        $('.navbar-wagon').show();
      }
    });

  }
});


