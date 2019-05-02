//global variables
var cur_tab = 0;
var array = new Array(); //history of the page traversal
show_tab(cur_tab);

init();
function init() {
  var prev_btn = document.getElementById("prev_btn");
  var next_btn = document.getElementById("next_btn");
  prev_btn.addEventListener('click', function(){
    prev();
  });
  next_btn.addEventListener('click', function(){
    next();
  });
  var form = document.querySelector('form')
  form.onkeypress = checkEnter;
  form.addEventListener('submit', function(event) {
    if (!validate_form()) {
      event.preventDefault();
      return false;
    } else {
      return true;
    }
  }, true);
}

function checkEnter(e){
 e = e || event;
 var txtArea = /textarea/i.test((e.target || e.srcElement).tagName);
 return txtArea || (e.keyCode || e.which || e.charCode || 0) !== 13;
}

function show_tab(n) {
  var tabs = document.getElementsByClassName("tab");
  tabs[n].style.display = "block";
  if (n == 0) {
    document.getElementById("prev_btn").style.display = "none";
  } else {
    document.getElementById("prev_btn").style.display = "inline";
  }
  if (n == (tabs.length - 1) || tabs[n] == document.getElementById("return_q")) {
    document.getElementById("sub_btn").style.display = "inline";
    document.getElementById("next_btn").style.display = "none";
  } else {
    document.getElementById("sub_btn").style.display = "none";
    document.getElementById("next_btn").style.display = "inline";
  }
}

function prev() {
  var tabs = document.getElementsByClassName("tab");
  tabs[cur_tab].style.display = "none";
  cur_tab = array.pop();
  show_tab(cur_tab);
}
function next() {
  if (!validate_form()) {
    return false;
  }
  var tabs = document.getElementsByClassName("tab");
  tabs[cur_tab].style.display = "none";
  array.push(cur_tab);
  cur_tab = cur_tab + 1;
  show_tab(cur_tab);
}

function validate_form() {
  return true;
  var tab = document.getElementsByClassName("tab")[cur_tab];
  var form_groups = tab.getElementsByClassName("form-group");
  var valid = true;
  for (var i = 0; i < form_groups.length; i++) {
    var form_group = form_groups[i];
    if (!form_group.classList.contains("required")) {
      continue;
    }
    if (form_group.classList.contains("email-group")) {     //  Email validation
      var email = form_group.getElementsByTagName("input")[0].value;
      var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if (!email) {
        form_group.getElementsByTagName("input")[0].classList.add("invalid");
        form_group.getElementsByTagName("input")[0].placeholder = "Please fill out this field.";
        valid = false;
      } else if (!re.test(String(email).toLowerCase())) {
        form_group.getElementsByTagName("input")[0].classList.add("invalid");
        form_group.getElementsByTagName("small")[0].innerHTML = "Please enter in a valid email."
        valid = false;
      } else {
        form_group.getElementsByTagName("input")[0].className = form_group.getElementsByTagName("input")[0].classList.remove("invalid");
        form_group.getElementsByTagName("small")[0].innerHTML = "Please enter in your email here."
      }
    } else if (form_group.classList.contains("radio-group")) {       // Radio Groups Validation
      var cnt = 0;
      var radios = form_group.getElementsByTagName("input");
      for (var j = 0; j < radios.length; j++) {
        if (radios[j].checked) {
          cnt = cnt + 1;
        }
      }
      if (cnt == 0) {
        form_group.classList.add("invalid");
        form_group.getElementsByClassName("form-text")[0].innerHTML = "Please fill out this field.";
        valid = false;
      } else {
        form_group.className += "form-control";
      }
    } else if (form_group.classList.contains("checkbox-group")) {   // Checkbox validation
      var cnt = 0;
      var checkboxes = form_group.getElementsByTagName("input");
      for (var j = 0; j < checkboxes.length; j++) {
        if (checkboxes[j].checked) {
          cnt = cnt + 1;
        }
      }
      if (cnt == 0) {
        form_group.classList.add("invalid");
        form_group.getElementsByClassName("form-text")[0].innerHTML = "Please fill out this field.";
        valid = false;
      } else {
        form_group.classList.remove("invalid");
      }
    } else if (form_group.classList.contains("dropdown-group")) {   // Dropdown validation
      var elems = form_group.getElementsByTagName("select");
      for (var j = 0; j < elems.length; j++) {
        var elem = elems[j];
        if (elem.value == "") {
          elem.classList.add("invalid");
          form_group.getElementsByClassName("form-text")[0].innerHTML = "Please fill out this field.";
          valid = false;
        } else {
          elem.classList.remove("invalid");
        }
      }
    } else { //regular text input
      var input = form_group.getElementsByTagName("input")[0];
      if (input.value == "") {
        // add an "invalid" class to the field:
        if (!input.classList.contains("invalid")) {
          input.classList.add("invalid");
        }
        input.placeholder = "Please fill out this field.";
        valid = false;
      } else {
        input.classList.remove("invalid");
      }
    }
  }
  return valid;
}
