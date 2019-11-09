$(function(){
  $("#checkout").click(function(){
    var firstname = $("#materialRegisterFormFirstName").val();
    var lastname  = $("#materialRegisterFormLastName").val();
    var address   = $("#materialRegisterFormAddress").val();
    var apartment = $("#materialRegisterFormApartment").val();
    var state_id  = $("#materialRegisterFormStates").val();
    var city_id   = $("#materialRegisterFormCities").val();
    var postal    = $("#materialRegisterFormZipCode").val();
    var save_shipping_address = $("input[id='shipping_address']").prop('checked');
    var dataString = "firstname="+firstname+"&lastname="+lastname+"&address="+address+"&apartment="+apartment+"&state_id="+state_id+"&city_id="+city_id+"&save_shipping_address="+save_shipping_address+"&postal="+postal;
    $.ajax({
      url: "/save_shipping_address",
      type: "GET",
      data: dataString,
      dataType: "JSON",
      success:function(data){
        if(data == "Saved successfully"){
          window.location.href = "/transaction_history"; 
        }
      },
      error:function(err){
        console.log(err);
      }
    })
    return false;
  });

  $("#materialRegisterFormCities").html("<option>Select City</option>");
  $("#materialRegisterFormStates").html("<option>Select State</option>");
  // Get All States from ph
  $.ajax({
    url: "/states",
    type: "GET",
    dataType: "JSON", 
    success: function(data){
      $.each(data,function(k, v){
        $("#materialRegisterFormStates").append(
          `<option value="${v.id}">
            ${v.region}
           </option>`)
      });
      
      $(`#materialRegisterFormStates`).change(function(){
        $("#materialRegisterFormCities").html("<option>Select City</option>");
        var state_id = this.value;
        // Get All Cities from specific region
        $.ajax({
          url: "/cities",
          type: "GET",
          data: {
            state_id: state_id
          },
          dataType: "JSON",
          success: function(city_data){
            $.each(city_data,function(k,v){
              $("#materialRegisterFormCities").append(
                `<option value="${v.id}">
                  ${v.name}
                 </option>`)  
            });
          },
          error: function(err){
            console.log(err)
          }
        });
      });
    },
    error: function(err){
      console.log(err);
    }
  });
});