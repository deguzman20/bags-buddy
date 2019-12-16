$(function(){
    function formatMoney(amount, decimalCount = 2, thousands = ",") {
        try {
          decimalCount = Math.abs(decimalCount);
          decimalCount = isNaN(decimalCount) ? 2 : decimalCount;

          const negativeSign = amount < 0 ? "-" : "";

          let i = parseInt(amount = Math.abs(Number(amount) || 0).toFixed(decimalCount)).toString();
          let j = (i.length > 3) ? i.length % 3 : 0;

          return negativeSign + (j ? i.substr(0, j) + thousands : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousands);
        } catch (e) {
          console.log(e)
        }
    };

    $("#checkout").hover(function(){
      $(this).css({
        "color":"white"
      });
    });

    $("#checkout").click(function(){
      window.location.href = "/shipping_address";
    });

    $("#continue_shopping").click(function(){
      window.location.href = "/";
    });

    $.ajax({
     url:'/get_sub_total',
     type:"GET",
     success:function(data){
       $("#txt-subtotal").html(formatMoney(data));
     },
     error:function(err){
      console.log(err);
     }
   });

   for (var i = 1; i <= 100; i++) {
     $("#amount-"+i).html("₱ "+formatMoney(parseInt($("#price-"+i).attr('class')) * parseInt($("#quantity-"+i).val())));
     $("#quantity-minus-"+i).click(function(){
      var id = this.id.replace("quantity-minus-","");
      function decrease(){
        if($("#quantity-"+id).val()>1){
          $("#quantity-"+id).val(Number($("#quantity-"+id).val())-1);
            $.ajax({
               url:"/decrease_product_quantity",
               type:"GET",
               data:{
                 cart_product_id: id
               },
               success:function(data){
                 $("#txt-subtotal").html(formatMoney(data));
                 $("#amount-"+id).html("₱ "+ formatMoney(parseInt($("#price-"+id).attr('class')) * parseInt($("#quantity-"+id).val())));
               },
               error:function(err){
                 console.log(err)
               }
           });

        }
        else{
          return false;
        }
      }
      setTimeout(decrease, 1000)
     });

     $("#quantity-plus-"+i).click(function(){
      var id = this.id.replace("quantity-plus-","");
      function increase(){
        $("#quantity-"+id).val(Number($("#quantity-"+id).val())+1);
         $.ajax({
            url:"/increase_product_quantity",
            type:"GET",
            data:{
              cart_product_id: id
            },
            success:function(data){
              $("#txt-subtotal").html(formatMoney(data));
              $("#amount-"+id).html("₱ "+formatMoney(parseInt($("#price-"+id).attr('class')) * parseInt($("#quantity-"+id).val())));
            },
            error:function(err){
              console.log(err)
            }
         });
       }
      setTimeout(increase, 1000)
     });

     $("#delete-"+i).click(function(){
       var id = this.id.replace("delete-","");
        $("#row-"+id).fadeOut();
        $.ajax({
          url:"/delete_cart_product",
          type:"GET",
          data: {
            id: id
          },
          dataType:"JSON",
          success:function(data){
            $("#txt-subtotal").html(formatMoney(data));
          },
          error:function(err){
            console.log(err)
          }
        });

     });

   }
});
