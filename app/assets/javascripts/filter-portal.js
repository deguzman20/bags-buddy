$(function(){
    $("#select_brand").change(function(){
     var brand = $(this).val();
	 var category = $("#select_category").val();

          if(brand == "Select Brand" && category == "Select Category"){
            $('.filter').show('1000');
            console.log('1');
          }
          else{
            if(brand !== "Select Brand" && category == "Select Category"){
              $(`.brand-${brand}`).show();
              $(`.filter:not(.brand-${brand})`).hide();
              console.log('2');
            }
            else if(brand == "Select Brand" && category !== "Select Category"){
              $(`.category-${category}`).show();
              $(`.filter:not(.category-${category})`).hide();
              console.log('3');
            }
            else if(brand !== "Select Brand" && category !== "Select Category" && brand !== "" && category !== ""){
              $(`div[class='brand-${brand}-category-${category}']`).show();
              $(`.filter:not(.brand-${brand}-category-${category})`).hide();
            }
          }
    });

	  $("#select_category").change(function(){
		var brand = $("#select_brand").val();
		var category = $(this).val();

          if(brand == "Select Brand" && category == "Select Category"){
            $('.filter').show('1000');
            console.log('5');
          }
          else{
            if(brand !== "Select Brand" && category == "Select Category"){
              $(`.brand-${brand}`).show();
              $(`.filter:not(.brand-${brand})`).hide();
              console.log('6');
            }
            else if(brand == "Select Brand" && category !== "Select Category"){
              $(`.category-${category}`).show();
              $(`.filter:not(.category-${category})`).hide();
              console.log('7');
            }
            else if(brand !== "Select Brand" && category !== "Select Category" && brand !== "" && category !== ""){
              $(`div[class='brand-${brand}-category-${category}']`).show();
              $(`.filter:not(.brand-${brand}-category-${category})`).hide();
            }
          }

	});
});
