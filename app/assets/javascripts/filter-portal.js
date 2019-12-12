$(function(){
    $("#select_brand_portal").change(function(){
     var brand = $(this).val();
     var category = $("#select_category_portal").val();

          if(brand == "Select Brand" && category == "Select Category"){
            $('.filter-portal').fadeIn();
          }
          else{
            if(brand !== "Select Brand" && category == "Select Category"){
              $(".brand-portal-"+brand).fadeIn();
              $(".filter-portal:not(.brand-portal-"+brand+")").fadeOut();
            }
            else if(brand == "Select Brand" && category !== "Select Category"){
              $(".category-portal-"+category).fadeIn();
              $(".filter-portal:not(.category-portal-"+category+")").fadeOut();
            }
            else if(brand !== "Select Brand" && category !== "Select Category" && brand !== "" && category !== ""){
              $(".filter-portal").not(".brand-portal-"+brand"-category-portal-"+category).fadeOut();
              $(".filter-portal").filter(".brand-portal-"+brand+"-category-portal-"+category).fadeIn();
            }
          }
    });

    $("#select_category_portal").change(function(){
      var brand = $("#select_brand_portal").val();
      var category = $(this).val();

          if(brand == "Select Brand" && category == "Select Category"){
            $('.filter-portal').fadeIn();
          }
          else{
            if(brand !== "Select Brand" && category == "Select Category"){
              $(".brand-portal-"+brand).fadeIn();
              $(".filter-portal:not(.brand-portal-"+brand+")").fadeOut();
            }
            else if(brand == "Select Brand" && category !== "Select Category"){
              $(".category-portal-"+category).fadeIn();
              $(".brand-portal-"+brand+"-category-portal-"+category).fadeIn();
              $(".filter-portal:not(.category-portal-"+category+")").fadeOut();
            }
            else if(brand !== "Select Brand" && category !== "Select Category" && brand !== "" && category !== ""){
              $(".filter-portal").not(".brand-portal-"+brand+"-category-portal-"+category).fadeOut();
              $(".filter-portal").filter(".brand-portal-"+brand+"-category-portal-"+category).fadeIn();
            }
          }
    });

    $("#select_brand_on_hand").change(function(){
      var brand = $(this).val();
	    var category = $("#select_category_on_hand").val();

          if(brand == "Select Brand" && category == "Select Category"){
            $('.filter-on-hand').fadeIn();
          }
          else{
            if(brand !== "Select Brand" && category == "Select Category"){
              $('.brand-on-hand-'+brand).fadeIn();
              $('.filter-on-hand:not(.brand-on-hand-'+brand+')').fadeOut();
            }
            else if(brand == "Select Brand" && category !== "Select Category"){
              $('.category-on-hand-'+category).fadeIn();
              $('.filter-on-hand:not(.category-on-hand-'+category+')').fadeOut();
            }
            else if(brand !== "Select Brand" && category !== "Select Category" && brand !== "" && category !== ""){
              $(".filter-on-hand").not('.brand-on-hand-'+brand+'-category-on-hand-'+category).fadeOut();
              $(".filter-on-hand").filter('.brand-on-hand-'+brand+'-category-on-hand-'+category).fadeIn();
            }
          }
    });

	  $("#select_category_on_hand").change(function(){
		  var brand = $("#select_brand_on_hand").val();
	   	var category = $(this).val();

          if(brand == "Select Brand" && category == "Select Category"){
            $('.filter-on-hand').fadeIn();
          }
          else{
            if(brand !== "Select Brand" && category == "Select Category"){
              $('.brand-on-hand-'+brand).fadeIn();
              $('.filter-on-hand:not(.brand-on-hand-'+brand')').fadeOut();
            }
            else if(brand == "Select Brand" && category !== "Select Category"){
              $('.category-on-hand-'+category).fadeIn();
              $('.brand-on-hand-'+brand+'-category-on-hand-'+category).fadeIn();
              $('.filter-on-hand:not(.category-on-hand-'+category')').fadeOut();
            }
            else if(brand !== "Select Brand" && category !== "Select Category" && brand !== "" && category !== ""){
              $(".filter-on-hand").not('.brand-on-hand-'+brand+'-category-on-hand-'+category).fadeOut();
              $(".filter-on-hand").filter('.brand-on-hand-'+brand+'-category-on-hand-'+category).fadeIn();
            }
          }
	  });
});
