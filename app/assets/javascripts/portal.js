$(function(){
   // $('[data-toggle="tooltip"]').tooltip();
   $(".btn-visit").click(function(){
     window.location.href = "/calculator";
   });

   $(".pre-order").hide().slice(0, 3).show();
     if ($(".pre-order:hidden").length == 0) {
       $("#pre-order-load").hide();
     }

     $("#pre-order-load").on('click', function (e) {
       e.preventDefault();
       $(".pre-order:hidden").slice(0, 3).slideDown();
       if ($(".pre-order:hidden").length == 0) {
         $("#pre-order-load").fadeOut('slow');
       }
    });

    $(".on-hand").hide().slice(0, 3).show();
     if ($(".on-hand:hidden").length == 0) {
       $("#on-hand-load").hide();
     }

     $("#on-hand-load").on('click', function (e) {
       e.preventDefault();
       $(".on-hand:hidden").slice(0, 3).slideDown();
       if ($(".on-hand:hidden").length == 0) {
         $("#on-hand-load").fadeOut('slow');
       }
    });

   $("#select_brand").change(function(){
    $("#select_category").html("<option>Select Category</option>");
    var id = this.value;

    $.ajax({
      url: "brand_category",
      type: "GET",
      dataType: "JSON",
      data: {
        id: id
      },
      success: function(brand_data){
        $.each(brand_data, function(k,v){
          $.ajax({
            url:"category",
            type: "GET",
            dataType:"JSON",
            data: {
              category_id: v.category_id
            },
            success: function(category_data){
                if(category_data != null){
                  $("#select_category").append("<option value="+category_data.id+">"+category_data.name+"</option>");
                }
                else{
                  $("#select_category").html("<option>Select Category</option>");
                }
            },
            error: function(err){
              console.log(err);
            }
          });
        });
      },
      error: function(err){
        console.log(err);
      }
    });
   });

  $("#select_brand_portal").change(function(){
    $("#select_category_portal").html("<option>Select Category</option>");
    var id = this.value;

    $.ajax({
      url: "brand_category",
      type: "GET",
      dataType: "JSON",
      data: {
        id: id
      },
      success: function(brand_data){
        $.each(brand_data, function(k,v){
          $.ajax({
            url:"category",
            type: "GET",
            dataType:"JSON",
            data: {
              category_id: v.category_id
            },
            success: function(category_data){
                if(category_data != null){
                  $("#select_category_portal").append("<option value="+category_data.id+">"+category_data.name+"</option>");
                }
                else{
                  $("#select_category_portal").html("<option>Select Category</option>");
                }
            },
            error: function(err){
              console.log(err);
            }
          });
        });
      },
      error: function(err){
        console.log(err);
      }
    });
  });

  $("#select_brand_on_hand").change(function(){
    $("#select_category_on_hand").html("<option>Select Category</option>");
    var id = this.value;

    $.ajax({
      url: "brand_category",
      type: "GET",
      dataType: "JSON",
      data: {
        id: id
      },
      success: function(brand_data){
          $.each(brand_data, function(k,v){
          $.ajax({
            url:"category",
            type: "GET",
            dataType:"JSON",
            data: {
              category_id: v.category_id
            },
            success: function(category_data){
                if(category_data != null){
                  $("#select_category_on_hand").append("<option value="+category_data.id+">"+category_data.name+"</option>");
                }
                else{
                  $("#select_category_on_hand").html("<option>Select Category</option>");
                }
            },
            error: function(err){
              console.log(err);
            }
          });
        });
      },
      error: function(err){
        console.log(err);
      }
    });

  });
});
