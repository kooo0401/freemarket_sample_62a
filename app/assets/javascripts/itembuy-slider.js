$(document).on('load',function(){
  var slideWidth = $('.itembuy-content__auter').outerWidth();
  var slideNum = $('.itembuy-content__auter').length;
  var slideSetWidth = slideWidth * slideNum * 1.1;
  $('#main').css('width',slideSetWidth);

  $('.itembuy-content__owl-carousel-thumb').mouseover(function(){
    var index = $('.itembuy-content__owl-carousel-thumb').index(this);
    setTimeout(function(){
      $('#main').animate({
        left: slideWidth * -index
      },350);
    },350);
  })

    $("#thumbs").children('img').css("opacity", '0.4');
    $("#thumbs").children('img').eq(0).css("opacity", '1.0');
    $("#thumbs").children('img').on('mouseover', function(){
    $("#thumbs").children('img').css("opacity", '0.4');
    $(this).css('opacity', '1');
  }); 
});