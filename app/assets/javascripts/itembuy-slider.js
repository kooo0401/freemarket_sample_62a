$(function(){
  let mouses = $(".owl-carousel-sub");
  function imageSelect(){
    // $(".active").removeClass("active");
    // $(this).addClass("active");
    // $('.active').css('opacity', '1');
    const index = mouses.index(this);
    var scrollvalue = -300 * index;
    $(".active").removeClass("active")
    $(this).addClass("active")
    $('.owl-carousel-space').css("left", scrollvalue);
    $('.active').css('opacity', '1');
    $(".owl-carousel-main").removeClass("show").eq(index).addClass("show")
    };
  function imageNotSelect(){
    $('.active').css('opacity', '0.4');
  }
  mouses.mouseenter(imageSelect); 
  mouses.mouseleave(imageNotSelect)
});

$(function()  {
  $(window).load(function(){
    $('.show').show();
    $('.active').css('opacity', '1');
  })
});