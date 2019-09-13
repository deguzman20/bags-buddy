$(function(){
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
          $(`#subtotal`).val(data.toString());
         },
         error:function(err){
          console.log(err);
         }
       });
    });

    $(`#confirm_to_add_to_cart`).click(function(){
      var brand_id = $(`#select_brand`).val();
      var category_id = $(`#select_category`).val();
      var price = $(`#price`).val();
      var subtotal = $(`#subtotal`).val();
      var quantity = $(`#quantity`).val();

      $.ajax({
        url: '/non_on_hand_add_to_cart',
        type: "GET",
        data: {
          price: price,
          subtotal: subtotal,
          brand_id: brand_id,
          category_id: category_id,
          item_type_id: 2,
          quantity: quantity
        },
        success: function(data){
          console.log(data);
        },
        error:function(err){
          console.log(err);
        }
      });

    });
});
