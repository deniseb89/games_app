// ****HOME****

function hideElems() {
  $("#title").hide();
  $("th").hide();
  $("#tic").hide();
  $("#hang").hide();
  fades();
}

function fades(){
  $("#title").fadeIn(1000, function() {
    $("th").fadeIn(1000, function() {
      $("#tic").fadeIn(1000); 
      $("#hang").fadeIn(1000);   
    });    
  });
}

function danceGames(){
  $(".game-menu").on("mousenter", function(){
    $(this).animate({
      fontSize: "150%"
    });
  });
  $(".game-menu").on("mouseleave", function(){
    $(this).animate({
      fontSize: "100%"
    });
  });
}

$(function(){
  hideElems();
  danceGames();
})
