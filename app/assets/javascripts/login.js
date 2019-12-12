$(function(){
  $("#materialLoginFormEmail, #materialLoginFormPassword").attr("autocomplete","off");

  $("button[type='submit']").click(function(e){
    var email = $("#materialLoginFormEmail").val();
    var password = $("#materialLoginFormPassword").val();
    if(email == "" || password == ""){
      $("#alert-panel").html("
        <div class='alert alert-danger'>
          <center><span>Email and Password has required</span></center>
        </div>
      ");
      e.preventDefault();
    }
    else{
      $("#alert-panel").html('');
    }
  });
});
