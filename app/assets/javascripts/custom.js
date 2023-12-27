
$(document).ready(function(){

  $(".province").click(function(){
    var province_id = $('#profile_province_id').val()
    console.log('Province id: ', province_id)

    $.get(
      `http://localhost:3000/cities/${province_id}/provinces`, 
      function(data, status){
      console.log(data, status);
      
    });

    
    alert("province")
  })

  var name = $('name #profile_address_attributes_city_id').text()
  console.log('name: ', name)
});
