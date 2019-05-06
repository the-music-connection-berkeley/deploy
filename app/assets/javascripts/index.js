
window.onload = init;
var index = 0;
var i = 0;

function init() {
  var text = ["Connecting .People", "Through |Music"];
  var typeInterval = setInterval(typeWriter, 200);
  var element = document.querySelector(".motto");
  var green = false;
  var red = false;

  function typeWriter() {
    var elem = element.children[index];
    if (elem) {
      if (text[index].charAt(i) == ".") {
        i++;
        green = true;
      } else if (text[index].charAt(i) == "|") {
        i++;
        red = true;
      }
      if (green){
        elem.innerHTML = elem.innerHTML + "<span class='green-underline'>" + text[index].charAt(i) + "</span>";
      } else if (red) {
        elem.innerHTML = elem.innerHTML + "<span class='red-underline'>" + text[index].charAt(i) + "</span>";
      } else {
        elem.innerHTML = elem.innerHTML + text[index].charAt(i);
      }
      i++;
      if (i == text[index].length) {
        i = 0;
        element.children[index].style.paddingBottom = "0";
        element.children[index].classList.remove("typewriter");
        index = index + 1;
        element.children[index].classList.add("typewriter");
        green = false;
        red = false;
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
