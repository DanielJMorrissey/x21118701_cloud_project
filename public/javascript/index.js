window.addEventListener("DOMContentLoaded", init);

function init(){
  document.addEventListener("submit", validate);
}

function validate(e){
  var name = document.getElementById("band_name").value;
  var genre = document.getElementById("band_genre").value;
  var flash = document.getElementById("flash");
  if(name.length == 0 || genre.length == 0){
    e.preventDefault()
    flash.innerHTML = "Please enter a name or genre!"
  }
}
