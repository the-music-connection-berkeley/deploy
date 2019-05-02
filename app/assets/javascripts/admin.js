var rows1;
var rows2;

window.onload = init;
function init() {
  rows1 = document.getElementById("table1").getElementsByTagName("tr");
  rows2 = document.getElementById("table2").getElementsByTagName("tr");
  document.getElementById("match_btn").addEventListener('click', function(){
    match_pair();
  });
  document.getElementById("undo_btn").addEventListener('click', function(){
    undo_pair();
  });
}

function match_pair() {
  var row1 = Array.from(rows1).filter(is_checked)[0];
  var row2 = Array.from(rows2).filter(is_checked)[0];
  var tutor_id = row1.getElementsByTagName('td')[5].innerText;
  var client_id = row2.getElementsByTagName('td')[5].innerText;
  var color = getRandomColor();
  row1.style.backgroundColor = color;
  row2.style.backgroundColor = color;
  fetch ('match_pair', {
    method: "post",
    body: JSON.stringify({"tutor_id":tutor_id, "client_id":client_id})
  }).then(function(response) {
    return response.text();
  });
}

function undo_pair() {
  var row1 = Array.from(rows1).filter(is_checked)[0];
  var row2 = Array.from(rows2).filter(is_checked)[0];
  var tutor_id = row1.getElementsByTagName('td')[5].innerText;
  var client_id = row2.getElementsByTagName('td')[5].innerText;
  row1.style.backgroundColor = "";
  row2.style.backgroundColor = "";
  fetch ('undo_pair', {
    method: "put",
    body: JSON.stringify({"tutor_id":tutor_id, "client_id":client_id})
  }).then(function(response) {
    return response.text();
  });

}

function is_checked(row) {
  if (row.classList.contains("thead-dark")) {
    return false;
  }
  var radio = row.getElementsByTagName("input")[0];
  return radio.checked;
}

function getRandomColor() {
   var letters = 'BCDEF'.split('');
   var color = '#';
   for (var i = 0; i < 6; i++ ) {
       color += letters[Math.floor(Math.random() * letters.length)];
   }
   return color;
}
