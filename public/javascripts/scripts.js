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

// ****TIC-TAC-TOE****

function startGame() {
  for (var i = 1; i <= 9; i ++) {
    clearBox(i);
  }
  turn = "X";
  if (Math.random() < 0.5) {
    turn = "O";
  }
  winner = null;
  setMessage(turn + " gets to start.");
}

function setMessage(msg) {
  $('#message').text(msg);
}

function nextMove(td) {
  if (winner != null) {
    setMessage(winner+" already won the game.");
  } else if (td.innerHTML == "") {
  td.innerHTML = turn;
  switchTurn();
  } else {
    setMessage("That square has already moved.");
  }
}

function switchTurn() {
  if (checkForWinner(turn)) {
    setMessage("Congratulations, "+turn+"! You win!");
    winner = turn;
  } else if (turn == "X") {
    turn = "O";
    setMessage("It's "+turn+"'s turn!");
  } else {
    turn = "X";
    setMessage("It's "+turn+"'s turn!");
  }
}

function checkForWinner(move) {
  var result = false;
  if (checkRow(1, 2, 3, move)) {
    result = true;
    $('#btn1').css("text-shadow", "1px 0px 20px white");
    $('#btn2').css("text-shadow", "1px 0px 20px white");
    $('#btn3').css("text-shadow", "1px 0px 20px white");
  } else if (checkRow(4, 5, 6, move)) {
      result = true;
    $('#btn4').css("text-shadow", "1px 0px 20px white");
    $('#btn5').css("text-shadow", "1px 0px 20px white");
    $('#btn6').css("text-shadow", "1px 0px 20px white");
  } else if (checkRow(7, 8, 9, move)) {
      result = true;
    $('#btn7').css("text-shadow", "1px 0px 20px white");
    $('#btn8').css("text-shadow", "1px 0px 20px white");
    $('#btn9').css("text-shadow", "1px 0px 20px white");
  } else if (checkRow(1, 4, 7, move)) {
      result = true;
    $('#btn1').css("text-shadow", "1px 0px 20px white");
    $('#btn4').css("text-shadow", "1px 0px 20px white");
    $('#btn7').css("text-shadow", "1px 0px 20px white");
  } else if (checkRow(2, 5, 8, move)) {
      result = true;
    $('#btn2').css("text-shadow", "1px 0px 20px white");
    $('#btn5').css("text-shadow", "1px 0px 20px white");
    $('#btn8').css("text-shadow", "1px 0px 20px white");
  } else if (checkRow(3, 6, 9, move)) {
      result = true;
    $('#btn3').css("text-shadow", "1px 0px 20px white");
    $('#btn6').css("text-shadow", "1px 0px 20px white");
    $('#btn9').css("text-shadow", "1px 0px 20px white");
  } else if (checkRow(1, 5, 9, move)) {
    result = true;
    $('#btn1').css("text-shadow", "1px 0px 20px white");
    $('#btn5').css("text-shadow", "1px 0px 20px white");
    $('#btn9').css("text-shadow", "1px 0px 20px white");
  } else if (checkRow(3, 5, 7, move)) {
    result = true;
    $('#btn3').css("text-shadow", "1px 0px 20px white");
    $('#btn5').css("text-shadow", "1px 0px 20px white");
    $('#btn7').css("text-shadow", "1px 0px 20px white");
  }
  return result;
}

function checkRow(a, b, c, move) {
  var result = false;
  if (getBox(a) == move &&
      getBox(b) == move &&
      getBox(c) == move) {
    result = true;
  }
  return result;
}

function getBox(num) {
  return document.getElementById("btn"+num).innerHTML;
}

function clearBox(num) {
  var button = document.getElementById("btn"+num);
  button.innerHTML = "";
  button.style.textShadow="none";
}

// ****HANGMAN****


// ****LOAD PAGES****
$(function(){
  hideElems();
  danceGames();
  startGame();
})