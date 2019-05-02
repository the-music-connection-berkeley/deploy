teacher_init();
function teacher_init() {
  document.getElementById("rem_time").style.display = "none";
  var add_time = document.getElementById("add_time");
  add_time.addEventListener('click', function() {
    var original = document.getElementsByClassName("time-group")[0];
    var cln = original.cloneNode(true);
    document.getElementById("time-groups").appendChild(cln);
    if (document.getElementsByClassName("time-group").length > 1) {
      document.getElementById("rem_time").style.display = "inline-block";
    }
  });
  var rem_time = document.getElementById("rem_time");
  rem_time.addEventListener('click', function () {
    var len = document.getElementsByClassName("time-group").length;
    var elem = document.getElementsByClassName("time-group")[len - 1];
    document.getElementById("time-groups").removeChild(elem);
    if (document.getElementsByClassName("time-group").length <= 1) {
      document.getElementById("rem_time").style.display = "none";
    }
  });
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
}

function display_other(elem) {
  var other = elem.getElementsByClassName("instr_other")[0];
  var val = elem.getElementsByTagName("select")[0].value;
  if (val == "Others") {
    other.style.display = 'block';
  } else {
    other.style.display = 'none';
  }
}
