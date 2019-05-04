
window.onload = init;

function init() {
  var scroll_btn = document.getElementById("scroll_btn");
  scroll_btn.addEventListener('click', function(){
    var elem = document.querySelector(".row");
    elem.scrollIntoView({
  behavior: 'smooth'
    });
  });
}
