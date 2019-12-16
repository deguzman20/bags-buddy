$(function(){
    $("#additional").hide();
    $("#btncalculate").click(function(){
        var brand_id = $(`#select_brand`).val();
        var category_id = $(`#select_category`).val();
        var id = $(`#price`).val();
        var quantity = $(`#quantity`).val();

        $.ajax({
         url:'/calculate',
         type:"GET",
         data:{
          price: id,
          quantity: quantity,
          brand_id: brand_id,
          category_id: category_id
         },
         success:function(data){
          $("#additional").val(data.additional.toString());
          $("#subtotal").val(data.subtotal.toString());
         },
         error:function(err){
          console.log(err);
         }
       });
    });

    $("#confirm_to_add_to_cart").click(function(){
      var brand_id = $("#select_brand").val();
      var category_id = $("#select_category").val();
      var price = $("#price").val();
      var subtotal = $("#subtotal").val();
      var quantity = $("#quantity").val();
      var additional = $("#additional").val();
      var shipping_type_id = $("#select-shipping-type").val();

      $.ajax({
        url: '/non_on_hand_add_to_cart',
        type: "GET",
        data: {
          price: price,
          subtotal: subtotal,
          brand_id: brand_id,
          category_id: category_id,
          item_type_id: 2,
          quantity: quantity,
          additional: additional,
          shipping_type_id: parseInt(shipping_type_id)
        },
        success: function(data){
          console.log(data);
          window.location.href = "/cart";
        },
        error:function(err){
          console.log(err);
        }
      });

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
                  if(category_data != ""){
                    $("#select_category").append("<option value="+category_data.id+">"+category_data.name+"</option>");
                    $("#select_category").change(function(){
                      // Get all Available Shipment type
                        $.ajax({
                          url: "shipping_type",
                          type: "GET",
                          dataType: "JSON",
                          data:{
                            brand_id: parseInt($("#select_brand").val()),
                            category_id: parseInt($("#select_category").val())
                          },
                          success: function(shipping_type_data){
                            $.each(shipping_type_data, function(k,v){
                              $("#select-shipping-type").append(
                                "<option value="+v.id+">"+v.name+"</option>"
                              );
                            });
                          },
                          error:function(err){
                            console.log(err);
                          }
                        });
                    });
                  }
                  else{
                    $("#select_category").html("<option>Select Category</option>");
                    $("#select-shipping-type").attr('disabled', 'disabled');
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
