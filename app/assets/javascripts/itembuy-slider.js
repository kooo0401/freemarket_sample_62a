$(function(){
  let mouses = $(".owl-carousel-sub");
  function imageSelect(){
    $(".active").removeClass("active");
    $(this).addClass("active");
    $('.active').css('opacity', '1');
    const index = mouses.index(this);
    $(".owl-carousel-main").removeClass("show").eq(index).addClass("show", function() {(
      ('.owl-carousel-space').scrollIntoView('left', '300')
    );
  });

  }
  function imageNotSelect(){
    $('.active').css('opacity', '0.4');
  }
  mouses.mouseenter(imageSelect); 
  mouses.mouseleave(imageNotSelect)
});

$(function()  {
  $(window).load(function(){
    $('.show').show()
  })
});