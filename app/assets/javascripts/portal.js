$(function(){
  $(`#select_brand`).change(function(){
    $("#select_category").html(`<option>Select Category</option>`);
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
                  $("#select_category").append(`<option value="${category_data.id}">${category_data.name}</option>`);
                }
                else{
                  $("#select_category").html(`<option>Select Category</option>`);
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