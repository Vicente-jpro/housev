
$(document).ready(function(){

  // Fist select
  $(".province").click(function(){
    var province_id = $('#profile_province_id').val()
    console.log('Province id: ', province_id)

    // Second select
    $.get(
      `http://localhost:3000/cities/${province_id}/province`, 
      function(data, status){
      console.log(data, status);
      
      $('#profile_address_attributes_city_id')
      .empty()

     for (var index = 0; index <= data.length; index++) {
        $('#profile_address_attributes_city_id')
          .append(`<option value="${data[index].id}"> ${data[index].city_name} </option>`);
     }

    });



  })

});
