$(function(){
    $("#Send").click(function(e){
        var firstname = $(`#firstname`).val();
        var lastname = $(`#lastname`).val();
        var email = $(`#email`).val();
        var website = $(`#website`).val();
        var subject = $(`#subject`).val();
        var message = $(`#message`).val();
        
        // alert(firstname);
        $.ajax({
            url: "/add_contact",
            type:"GET",
            data: { 
                firstname:firstname,
                message:message,
                lastname:lastname,
                email:email,
                website:website,
                subject:subject,
                message:message
            },
            dataType: "JSON",
            success:function(data){
            console.log(data)
            alert(firstname);   
            },
            error:function(err){
            console.log(err)  
            }
        });
    }); 
});