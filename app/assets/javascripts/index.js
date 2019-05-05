
window.onload = init;
var index = 0;
var i = 0;

function init() {
  var text = ["Connecting People", "Through Music"];
  var typeInterval = setInterval(typeWriter, 200);
  var element = document.querySelector(".motto");

  function typeWriter() {
    var elem = element.children[index];
    if (elem) {
      elem.innerHTML = elem.innerHTML + text[index].charAt(i);
      i++;
      if (i == text[index].length) {
        i = 0;
        element.children[index].classList.remove("typewriter");
        index = index + 1;
        element.children[index].classList.add("typewriter");
      }
    } else {
      clearInterval(typeInterval);
    }
  }


  var scroll_btn = document.getElementById("scroll_btn");
  scroll_btn.addEventListener('click', function(){
    var elem = document.querySelector(".row");
    elem.scrollIntoView({
  behavior: 'smooth'
    });
  });
}
