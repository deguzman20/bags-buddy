$(function(){
    $("#select_brand").change(function(){
     var brand = $(this).val();
	   var category = $("#select_category").val();

          if(brand == "Select Brand" && category == "Select Category"){
            $('.filter').fadeIn();
          }
          else{
            if(brand !== "Select Brand" && category == "Select Category"){
              $(`.brand-${brand}`).fadeIn();
              $(`.filter:not(.brand-${brand})`).fadeOut();
            }
            else if(brand == "Select Brand" && category !== "Select Category"){
              $(`.category-${category}`).fadeIn();
              $(`.filter:not(.category-${category})`).fadeOut();
            }
            else if(brand !== "Select Brand" && category !== "Select Category" && brand !== "" && category !== ""){
              $(".filter").not(`.brand-${brand}-category-${category}`).fadeOut();
              $(".filter").filter(`.brand-${brand}-category-${category}`).fadeIn();
            }
          }
    });

	  $("#select_category").change(function(){
		  var brand = $("#select_brand").val();
	   	var category = $(this).val();

          if(brand == "Select Brand" && category == "Select Category"){
            $('.filter').fadeIn();
          }
          else{
            if(brand !== "Select Brand" && category == "Select Category"){
              $(`.brand-${brand}`).fadeIn();
              $(`.filter:not(.brand-${brand})`).fadeOut();
            }
            else if(brand == "Select Brand" && category !== "Select Category"){
              $(`.category-${category}`).fadeIn();
              $(`.brand-${brand}-category-${category}`).fadeIn();
              $(`.filter:not(.category-${category})`).fadeOut();
            }
            else if(brand !== "Select Brand" && category !== "Select Category" && brand !== "" && category !== ""){
              $(".filter").not(`.brand-${brand}-category-${category}`).fadeOut();
              $(".filter").filter(`.brand-${brand}-category-${category}`).fadeIn();
            }
          }

	});
});
