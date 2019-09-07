$(function(){
  $('#tbl_product_mst_major_category_id').change(function() {
   var input_val = $('#tbl_product_mst_major_category_id').val();
  if(input_val == 1||input_val == 2) {
  $('#tbl_product_mst_brand_id').css('display', 'block');
  }else
  $('#tbl_product_mst_brand_id').css('display', 'none'); 
  });
});