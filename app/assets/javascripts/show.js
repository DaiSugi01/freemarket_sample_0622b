$(function(){
  $('.exhibit-container__product-datail__main__left__sub-images img').click(function(){
   var $thisImg = $(this).attr('src');
   var $thisAlt = $(this).attr('alt');
   $('.exhibit-container__product-datail__main__left__main-image img').attr({src:$thisImg,alt:$thisAlt});
  });
 });