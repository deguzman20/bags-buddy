$(function(){
  function validate(selector){
    $("#"+selector).css({
      "border-bottom": "0.1px solid pink"
    });
  }

  function onchange_validation(selector){
    if($("#"+selector).length == 0){
      validate(selector);
      return false;
    }
    else{
      $("#"+selector).css({
        "border-bottom": "1px solid green"
      });
    }
  }

  var first_name = $("#materialRegisterFormFirstName");
  var last_name  = $("#materialRegisterFormLastName")
  var birthdate  = $("#materialRegisterFormBirthdate");
  var email      = $("#materialRegisterFormEmail");
  var password   = $("#materialRegisterFormPassword");
  var retype_password   = $("#materialRegisterFormPasswordConfirmation");

  first_name.keyup(function(){
    onchange_validation("materialRegisterFormFirstName");
  });

  last_name.keyup(function(){
    onchange_validation("materialRegisterFormLastName");
  });

  birthdate.change(function(){
    onchange_validation("materialRegisterFormBirthdate");
  });

  email.keyup(function(){
    onchange_validation("materialRegisterFormEmail");
  });

  password.keyup(function(){
    onchange_validation("materialRegisterFormPassword");
  });

  retype_password.keyup(function(){
    onchange_validation("materialRegisterFormPasswordConfirmation");
  });

  $("#materialRegisterFormFirstName, #materialRegisterFormBirthdate, #materialRegisterFormLastName, #materialRegisterFormEmail, #materialRegisterFormPassword, #materialRegisterFormPasswordConfirmation").attr("autocomplete","off");

  $(".btn-register").click(function(e){i
    e.preventDefault();
    window.location.href = "sign_in";
  });

  $("input[name='commit']").click(function(e){
    var first_name = $("#materialRegisterFormFirstName").val();
    var last_name  = $("#materialRegisterFormLastName").val();
    var birthdate  = $("#materialRegisterFormBirthdate").val();
    var email      = $("#materialRegisterFormEmail").val();
    var password   = $("#materialRegisterFormPassword").val();
    var retype_password   = $("#materialRegisterFormPasswordConfirmation").val();

    if(first_name.length == 0){
      validate("materialRegisterFormFirstName");
      e.preventDefault();
    }
    if(last_name.length == 0){
      validate("materialRegisterFormLastName");
      e.preventDefault();
    }
    if(birthdate.length == 0){
      validate("materialRegisterFormBirthdate");
      e.preventDefault();
    }
    if(email.length == 0){
      validate("materialRegisterFormEmail");
      e.preventDefault();
    }
    if(password.length == 0){
      validate("materialRegisterFormPassword");
      e.preventDefault();
    }
    if(retype_password.length == 0){
      validate("materialRegisterFormPasswordConfirmation");
      e.preventDefault();
    }

    if(first_name.length == 0 || last_name.length == 0 || birthdate.length == 0 || email.length == 0 ||
       password.length == 0 || retype_password.length == 0){
        $("#error_message").html('<div class="alert alert-danger"><center>All fields are required</center></div>');
        return false;
    }

    if(first_name.length != 0 && last_name.length != 0 && birthdate.length != 0 &&  email.length !=0 &&
      password.length != 0 && retype_password.length != 0){
      if(password != retype_password){
        validate("materialRegisterFormPasswordConfirmation");
        $("#error_message").html('<div class="alert alert-danger"><center>Password and Confirm password did not match</center></div>');
        e.preventDefault();
      }
    }
  });
});
