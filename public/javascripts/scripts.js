function startGame(){
  for (var i = 1; i <= 9; i + 1){
    clearBox(i);
  }
  document.turn = "X";
  if (Math.random() < 0.5){
    document.turn = "O";
  }
  document.winner = null;
  setMessage(document.turn + " gets to start.");
}

function setMessage(msg){
  document.getElementById("message").innerHTML = msg;
}

$(function(){
  startGame();
});

function nextMove(td){
  if (document.winner != null) {
    setMessage(document.winner + " already won the game.");
  } else if(td.innerHTML == ""){
    td.innerHTML = document.turn;
    switchTurn();
  } else {
    setMessage("That square has already moved.");
  }
}

function switchTurn(){
  if (winner(document.turn)){
    setMessage("Congratulations, " + document.turn + "! You win!");
    document.winner = document.turn;
  } else if (document.turn == "X"){
    document.turn = "O";
    setMessage("It's " + document.turn + "'s turn!");
  } else {
    document.turn = "X";
    setMessage("It's " + document.turn + "'s turn!");
  }
}

function winner(move){
  var result = false;
  if(checkRow(1, 2, 3, move) || 
     checkRow(4, 5, 6, move) || 
     checkRow(7, 8, 9, move) ||
     checkRow(1, 4, 7, move) ||
     checkRow(2, 5, 8, move) ||
     checkRow(3, 6, 9, move) ||
     checkRow(1, 5, 9, move) ||
     checkRow(3, 5, 7, move)) {
    result = true;
  }
  return result;
}

function checkRow(a, b, c, move){
  var result = false;
  if(getBox(a) == move && getBox(b) == move && getBox(c) == move){
    result = true;
  }
  // return result;
}

function getBox(number) {
  return document.getElementById("btn" + number).innerHTML;
}

function clearBox(number){
  document.getElementById("btn" + number).innerHTML = "";
}