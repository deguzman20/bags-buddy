$(function(){
  $("#add_to_wishlist").click(function(e){
    var product_id = $("#product_id").val();
    
    $.ajax({
      url: "/add_to_wishlist",
      type: "GET",
      data: {
        product_id: product_id
      },
      dataType: "JSON",
      success:function(data){
        if(data == "Empty Session"){
          window.location.href = "/";  
        }
        else{
          window.location.href ="/wishlist";
        }
      },
      error:function(err){
        console.log(err)
      }
    })  
  });

  $("#add_to_cart").click(function(e){
    var quantity = $("#qty").val();
    var product_id = $("#product_id").val();
    $.ajax({
      url: "/single_product_add_to_cart",
      type: "GET",
      data: {
        quantity: quantity,
        id: product_id
      },
      dataType: "JSON",
      success:function(data){
        if(data['response'] == "Successfuly add to cart"){
          window.location.href = "/cart";
        }
      },
      error:function(err){
        console.log(err)
      } 
    });
  });
});