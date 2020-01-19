$(function(){
  function input_checkout_validation(selector){
    if(selector.val() == ""){
      selector.css({"bottom" : "1px solid #712b29", "background-color": "#f7dddc"});
    }
    else{
      selector.css({"bottom" : "1px solid #ced4da", "background-color": "white"});
    }
  }

  function selected_checkout_validation(selector){
    if(selector.children("option:selected").val() == ""){
      selector.css({"bottom" : "1px solid #712b29", "background-color": "#f7dddc"});
    }
    else{
      selector.css({"bottom" : "1px solid #ced4da", "background-color": "white"});
    }
  }

  $("#materialRegisterFormStates").change(function(){
    selected_checkout_validation($(this));
  });

  $("#materialRegisterFormCities").change(function(){
    selected_checkout_validation($(this));
  });

  $("#checkout").click(function(){
    var firstname = $("#materialRegisterFormFirstName").val();
    var lastname  = $("#materialRegisterFormLastName").val();
    var address   = $("#materialRegisterFormAddress").val();
    var apartment = $("#materialRegisterFormApartment").val();
    var state_id  = $("#materialRegisterFormStates").val();
    var city_id   = $("#materialRegisterFormCities").val();
    var email    = $("#aterialRegisterFormEmail").val();
    var save_shipping_address = $("input[id='shipping_address']").prop('checked');
    var dataString = "firstname="+firstname+"&lastname="+lastname+"&address="+address+"&apartment="+apartment+"&state_id="+state_id+"&city_id="+city_id+"&save_shipping_address="+save_shipping_address+"&email="+email;
      if(firstname != "" && lastname != "" && address != "" && apartment !="" && state_id != "" && city_id != "" && email !=""){
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
        });
      }
      else{
        input_checkout_validation($("#materialRegisterFormFirstName"));
        input_checkout_validation($("#materialRegisterFormLastName"));
        input_checkout_validation($("#materialRegisterFormAddress"));
        input_checkout_validation($("#materialRegisterFormApartment"));
        input_checkout_validation($("#materialRegisterFormStates option:selected"));
        input_checkout_validation($("#materialRegisterFormCities option:selected"));
        input_checkout_validation($("#materialRegisterFormEmail"));
        input_checkout_validation($("#materialRegisterFormMobileNo"));
        selected_checkout_validation($("#materialRegisterFormStates"));
        selected_checkout_validation($("#materialRegisterFormCities"));
        return false;
      }
  });
  // Keyup method
    $("#materialRegisterFormFirstName").keyup(function(){
      if($("#materialRegisterFormFirstName").val() == ""){
        $("#materiallRegisterFormFirstName").css({"bottom" : "1px solid #712b29", "background-color": "#f7dddc"});
      }
      else{
        $("#materialRegisterFormFirstName").css({"bottom" : "1px solid #ced4da", "background-color": "white"});
      }
    })
    $("#materialRegisterFormLastName").keyup(function(){
      if($("#materialRegisterFormLastName").val() == ""){
        $("#materiallRegisterFormLastName").css({"bottom" : "1px solid #712b29", "background-color": "#f7dddc"});
      }
      else{
        $("#materialRegisterFormLastName").css({"bottom" : "1px solid #ced4da", "background-color": "white"});
      }
    })

    $("#materialRegisterFormAddress").keyup(function(){
      if($("#materialRegisterFormAddress").val() == ""){
        $("#materiallRegisterFormAddress").css({"bottom" : "1px solid #712b29", "background-color": "#f7dddc"});
      }
      else{
        $("#materialRegisterFormAddress").css({"bottom" : "1px solid #ced4da", "background-color": "white"});
      }
    })

    $("#materialRegisterFormApartment").keyup(function(){
      if($("#materialRegisterFormApartment").val() == ""){
        $("#materiallRegisterFormApartment").css({"bottom" : "1px solid #712b29", "background-color": "#f7dddc"});
      }
      else{
        $("#materialRegisterFormApartment").css({"bottom" : "1px solid #ced4da", "background-color": "white"});
      }
    });

    $("#materialRegisterFormMobileNo").keyup(function(){
      if($("#materialRegisterFormMobileNo").val() == ""){
        $("#materiallRegisterFormMobileNo").css({"bottom" : "1px solid #712b29", "background-color": "#f7dddc"});
      }
      else{
        $("#materialRegisterFormMobileNo").css({"bottom" : "1px solid #ced4da", "background-color": "white"});
      }
    });

    $("#materialRegisterFormEmail").keyup(function(){
      if($("#materialRegisterFormEmail").val() == ""){
        $("#materialRegisterFormEmail").css({"bottom" : "1px solid #712b29", "background-color": "#f7dddc"});
      }
      else{
        $("#materialRegisterFormEmail").css({"bottom" : "1px solid #ced4da", "background-color": "white"});
      }
    });

  $("#materialRegisterFormStates").html("<option value=''>Select State</option>");
  $("#materialRegisterFormCities").html("<option value=''>Select City</option>");
  // Get All States from ph
  $.ajax({
    url: "/states",
    type: "GET",
    dataType: "JSON",
    success: function(data){
      $.each(data,function(k, v){
        $("#materialRegisterFormStates").append("<option value="+v.id+">"+v.region+"</option>");
      });

      $("#materialRegisterFormStates").change(function(){
        $("#materialRegisterFormCities").html("<option value=''>Select City</option>");
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
              $("#materialRegisterFormCities").append("<option value="+v.id+">"+v.name+"</option>");
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
