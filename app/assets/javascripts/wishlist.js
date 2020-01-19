$(function(){
  for(var i = 1; i<= 100; i++){
    $("a[id='remove-wishlist-"+i+"']").click(function(){
      var id = parseInt(this.id.replace("remove-wishlist-",""));
      $.ajax({
        url: "/remove_item_from_wishlist",
        type: "GET",
        data: {
          id: id
        },
        success:function(data){
          if(data == "Item Removed"){
            $("#wishlist-row-"+id).fadeOut();       
          }
        },
        error:function(err){
          console.log(err)
        }
      });
    });
 
    $("a[id='wishlist-add-to-cart-"+i+"']").click(function(){
      var id = parseInt(this.id.replace("wishlist-add-to-cart-",""));
      $.ajax({
        url: "/wishlist_add_to_cart",
        type: "GET",
        data: {
          wishlist_id: id
        },
        dataType: "JSON",
        success:function(data){
          console.log(data);
        },
        error:function(err){
          console.log(err);
        }
      });
    });   
  }
});