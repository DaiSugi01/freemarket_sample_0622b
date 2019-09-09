$(function(){
  $('#tbl_product_mst_major_category_id').change(function() {
   var input_val = $('#tbl_product_mst_major_category_id').val();
  if(input_val == 1||input_val == 2) {
  $('#tbl_product_mst_brand_id').css('display', 'block');
  }else
  $('#tbl_product_mst_brand_id').css('display', 'none'); 
  });
});

$(function(){
  $('#product-file').change(function(){
    if ( !this.files.length ) {
      return;
    }
    $('#preview-file').text('');
 
    var $files = $(this).prop('files');
    var len = $files.length;
    for ( var i = 0; i < len; i++ ) {
    if(i ==5){
      break;
    }
      var file = $files[i];
      var fr = new FileReader();
 
      fr.onload = function(e) {
        var src = e.target.result;
        var img = '<img src="'+ src +'">';
        $('#preview-file').append(img);
        $('img').addClass('preview-file-size');
      }
 
      fr.readAsDataURL(file);

    }
 
    $('#preview-file').css('display','block');
    $('.exhibit-container__main__sell__upload-box__upload-area__text').css('display','none');
  });
});