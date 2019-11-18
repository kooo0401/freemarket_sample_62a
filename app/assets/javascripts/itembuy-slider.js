$(function(){
  let mouses = $(".owl-carousel-sub");
  function mouseover(){
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = mouses.index(this);
    $(".owl-carousel-main").removeClass("show").eq(index).addClass("show");
    $(".owl-carousel-main").addClass("hide").eq(index).removeClass("hide");
    $('.show').fadeIn(1000);
    $('.hide').hide();
  }
  mouses.mouseleave(mouseover); 
});

$(function()  {
  $(window).load(function(){
    $('.hide').hide()
  })
});