$(document).ready(function() {
  var isRootUrl = (window.location.pathname.toLowerCase() === "/");
  var isCocktailIndexUrl = (window.location.pathname.toLowerCase() === "/cocktails");

  if (isRootUrl || isCocktailIndexUrl) {
    $(window).on("scroll", function(event) {
      var verticalPosition = $(window).scrollTop();
      if(verticalPosition  > 500) {
        // $('.navbar-wagon').show();
        $('.navbar-wagon').removeClass('navbar-hidden');
      }
      if(verticalPosition  <= 500) {
        $('.navbar-wagon').addClass('navbar-hidden');
      }
    });

  }
});


