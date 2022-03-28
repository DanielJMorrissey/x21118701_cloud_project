window.addEventListener("DOMContentLoaded", init);

function init(){
  document.addEventListener("submit", validate);
  document.addEventListener("change", membersCheck);
  var name = document.getElementById("band_name");
  name.addEventListener("change", check);
  var genre = document.getElementById("band_genre");
  genre.addEventListener("change", check);
}

function validate(e){
  var name = document.getElementById("band_name").value;
  var genre = document.getElementById("band_genre").value;
  var flash = document.getElementById("flash");
  if(name.length == 0 || genre.length == 0){
    e.preventDefault();
    flash.innerHTML = "Please enter a name or genre!";
  }
}

function membersCheck(){
  var members = document.getElementById("band_members");
  if(members.value < 0){
    members.value = members.value * -1;
  } else if(members.value == 0){
    members.value = 1;
  }
}

function check(e){
  var field = document.getElementById(e.target.id).value;
  if(e.target.id == "band_name"){
    var error = document.getElementById("nameError");
  } else if (e.target.id == "band_genre"){
    var error = document.getElementById("genreError");
  }
  if(field.length == 0){
    error.innerHTML = "Please enter a name or genre";
  } else {
    error.innerHTML = "";
  }
}
