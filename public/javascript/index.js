window.addEventListener("DOMContentLoaded", init);

function init(){
  document.addEventListener("submit", validate);
  document.addEventListener("change", membersCheck);
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
