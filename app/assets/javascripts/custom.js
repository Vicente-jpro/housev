
$(document).ready(function(){

  $(".pais").click(function(){
    alert("pais")
  })


 $.get(
  "https://jsonplaceholder.typicode.com/users", 
  function(data, status){
  console.log(data, status);
});

});
