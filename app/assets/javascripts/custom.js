
$(document).ready(function(){

  $(".pais").click(function(){
    alert("pais")
  })


  $.get(
    "http://localhost:3000/cities", 
    function(data, status){
    console.log(data, status);
  });

});
