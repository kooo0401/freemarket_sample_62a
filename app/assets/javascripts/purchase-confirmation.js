$(function(){  

  $( '#acdn-button' ).click( function(){
    $( '#acdn-target' ).slideToggle();
    // console.log(this)
    $("i", this).toggleClass("fa-chevron-down fa-chevron-up");
    // $("i", this).toggleClass("fa-chevron-up");
    // console.log(this);
  });

  $('input[name="point"]:radio').change(function(){
    let selectedval = $(this).val();
    if(selectedval == 2) {
      console.log('aaa');
      $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').removeAttr('disabled');
    }
    else if(selectedval == 1) {
      $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').attr('disabled','disabled');
      let price_to_paid = 3980- 200;
      $('#data-buy-pay').html(price_to_paid);
    }
    else {
      $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').attr('disabled','disabled');
    }

  })

  $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').on('keyup', function(){
    let used_point = $(this).val();
    let price_to_paid = 3980 - used_point;
    $('#data-buy-pay').html(price_to_paid);
  })


});