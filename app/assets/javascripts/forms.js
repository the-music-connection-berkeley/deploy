//global variables
var cur_tab = 0;
var array = new Array(); //history of the page traversal
var jump = 1; //unit of traversal of question flow
var time_count = 0;
show_tab(cur_tab);

init();
function init() {
  //Event Listener for prev, next, and submit
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

  //Event Listener for adding/removing instruments
  document.getElementById("rem_instr").style.display = "none";
  var instrument = document.getElementsByClassName("instrument")[0];
  if (instrument != null) {
    instrument.addEventListener('change', function(){
      display_other(instrument);
    });
  }
  var add_instr = document.getElementById("add_instr");
  add_instr.addEventListener('click', function() {
    var original = document.getElementsByClassName("instrument")[0];
    var cln = original.cloneNode(true);

    if (cln != null) {
      cln.addEventListener('change', function(){
        display_other(cln);
      });
    }
    var other = cln.getElementsByClassName("instr_other")[0];
    var val = cln.getElementsByTagName("select")[0].value;
    if (val == "Others") {
      other.style.display = 'block';
    } else {
      other.style.display = 'none';
    }
    document.getElementById("instruments").appendChild(cln);
    if (document.getElementsByClassName("instrument").length > 1) {
      document.getElementById("rem_instr").style.display = "inline-block";
    }
  });
  var rem_instr = document.getElementById("rem_instr");
  rem_instr.addEventListener('click', function () {
    var len = document.getElementsByClassName("instrument").length;
    var elem = document.getElementsByClassName("instrument")[len - 1];
    document.getElementById("instruments").removeChild(elem);
    if (document.getElementsByClassName("instrument").length <= 1) {
      document.getElementById("rem_instr").style.display = "none";
    }
  });

  //Event Listener for adding/removing time availability
  var add_time = document.getElementById("add_time");
  add_time.addEventListener('click', function() {
    var original = document.getElementsByClassName("time-group")[0];
    var cln = original.cloneNode(true);
    document.getElementById("time-groups").appendChild(cln);
    if (document.getElementsByClassName("time-group").length > 1) {
      document.getElementById("rem_time").style.display = "inline-block";
    }
  });
  document.getElementById("rem_time").style.display = "none";
  var rem_time = document.getElementById("rem_time");
  rem_time.addEventListener('click', function () {
    var len = document.getElementsByClassName("time-group").length;
    var elem = document.getElementsByClassName("time-group")[len - 1];
    document.getElementById("time-groups").removeChild(elem);
    if (document.getElementsByClassName("time-group").length <= 1) {
      document.getElementById("rem_time").style.display = "none";
    }
  });
}

//Displays the 'other' text field for custom instrument
function display_other(elem) {
  var other = elem.getElementsByClassName("instr_other")[0];
  var val = elem.getElementsByTagName("select")[0].value;
  if (val == "Others") {
    other.style.display = 'block';
  } else {
    other.style.display = 'none';
  }
}

//prevents submission through pressing 'Enter' key
function checkEnter(e){
 e = e || event;
 var txtArea = /textarea/i.test((e.target || e.srcElement).tagName);
 return txtArea || (e.keyCode || e.which || e.charCode || 0) !== 13;
}

// Selectively show nth tab and hide others
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
  //tab navigation listener
  var jump_group0 = tabs[cur_tab].querySelector("#jump-group0");
  if (jump_group0 != null) {
    var radios = jump_group0.getElementsByTagName('input');
    for (var i = 0; i < radios.length; i++) {
      if (radios[i].value == "No" && radios[i].checked) {
        jump = 2;
      }
    }
  }
  var jump_group1 = tabs[cur_tab].querySelector("#jump-group1");
  if (jump_group1 != null) {
    var radios = jump_group1.getElementsByTagName('input');
    for (var i = 0; i < radios.length; i++) {
      if (radios[i].value == "No" && radios[i].checked) {
        jump = 2;
      }
    }
  }
  var jump_group2 = tabs[cur_tab].querySelector("#jump-group2");
  if (jump_group2 != null) {
    var radios = jump_group2.getElementsByTagName('input');
    for (var i = 0; i < radios.length; i++) {
      if (radios[i].value == "New" && radios[i].checked) {
        jump = 2;
      }
    }
  }
  var jump_group3 = tabs[cur_tab].querySelector("#jump-group3");
  if (jump_group3 != null) {
    jump = 2;
  }
  cur_tab = cur_tab + jump;
  jump = 1;
  show_tab(cur_tab);
}

// Form validation
function validate_form() {
  return true;
  var tab = document.getElementsByClassName("tab")[cur_tab];
  var form_groups = tab.getElementsByClassName("form-group");
  var valid = true;
  var invalid_elems = []
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
        invalid_elems += [form_group]
        form_group.getElementsByTagName("input")[0].placeholder = "Please fill out this field.";
        valid = false;
      } else if (!re.test(String(email).toLowerCase())) {
        form_group.getElementsByTagName("input")[0].classList.add("invalid");
        invalid_elems += [form_group]
        form_group.getElementsByTagName("small")[0].innerHTML = "Please enter in a valid email."
        valid = false;
      } else {
        invalid_elems.remove(invalid_elems.indexOf(form_group));
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
        invalid_elems += [form_group]
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
        invalid_elems += [form_group]
        form_group.classList.add("invalid");
        form_group.getElementsByClassName("form-text")[0].innerHTML = "Please fill out this field.";
        valid = false;
      } else {
        invalid_elems.remove(invalid_elems.indexOf(form_group));
        form_group.classList.remove("invalid");
      }
    } else if (form_group.classList.contains("dropdown-group")) {   // Dropdown validation
      var elems = form_group.getElementsByTagName("select");
      for (var j = 0; j < elems.length; j++) {
        var elem = elems[j];
        if (elem.value == "") {
          invalid_elems += [form_group]
          elem.classList.add("invalid");
          form_group.getElementsByClassName("form-text")[0].innerHTML = "Please fill out this field.";
          valid = false;
        } else {
          invalid_elems.remove(invalid_elems.indexOf(form_group));
          elem.classList.remove("invalid");
        }
      }
    } else { //regular text input
      var input = form_group.getElementsByTagName("input")[0];
      if (input.value == "") {
        // add an "invalid" class to the field:
        if (!input.classList.contains("invalid")) {
          invalid_elems += [form_group]
          input.classList.add("invalid");
        }
        input.placeholder = "Please fill out this field.";
        valid = false;
      } else {
        invalid_elems.remove(invalid_elems.indexOf(form_group));
        input.classList.remove("invalid");
      }
    }
  }
  return valid;
}
