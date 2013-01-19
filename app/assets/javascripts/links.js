$(document).ready(function(){
  if(("standalone" in window.navigator) && window.navigator.standalone) {
    $('a').click(function(event) {
      event.preventDefault();
      // Manually change the location of the page to stay in
      // "Standalone" mode and change the URL at the same time.
      location.href = $(event.target).attr("href");
    });
  }

  setTimeout(function(){
    $("div.alert").fadeOut("slow", function () {
      $("div.alert").remove();
    });
  }, 
  2000);
});