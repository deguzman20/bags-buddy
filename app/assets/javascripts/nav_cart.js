$(function(){
  var item_count = $("div[class='miniproduct'] > .item01").length;
  $(".product_qun").html(item_count);
  for(var i = 1; i <= 100; i++){
    $("#remove_"+i).click(function(e){
      var id = this.id.replace("remove_","");
      $("#item_"+id).html("");
      $.ajax({
        url: "/remove_cart_product",
        type:"GET",
        data: { 
          id: id 
        },
        dataType: "JSON",
        success:function(data){
          console.log(data)
          if(data["response"] == "Cart Product Deleted"){
            item_count = $("div[class='miniproduct']").length;
            console.log(item_count)
            e.preventDefault();
          }
        },
        error:function(err){
          console.log(err)  
        }
      });
    }); 
  }
});