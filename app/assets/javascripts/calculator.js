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
          $(`#additional`).val(data.additional.toString());
          $(`#subtotal`).val(data.subtotal.toString());
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
      var additional = $(`#additional`).val();

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
          additional: additional
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
});
