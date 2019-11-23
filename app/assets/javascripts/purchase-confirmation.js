$(function(){  

  $( '#acdn-button' ).click( function(){
    $( '#acdn-target' ).slideToggle();
    $("i", this).toggleClass("fa-chevron-down fa-chevron-up");
  });

  $('input[name="point"]:radio').change(function(){
    let selectedval = $(this).val();
    if(selectedval == 2) {
      $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').removeAttr('disabled');
    }
    else if(selectedval == 1) {
      $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').attr('disabled','disabled');
      let price_to_paid_with_all_point = gon.product_price - gon.all_point;
      let result_all_point_used = '¥' + price_to_paid_with_all_point
      $('#data-buy-pay').html(result_all_point_used);
    }
    else {
      $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').attr('disabled','disabled');
    }

  })

  $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').on('keyup', function(){
    let used_point = $(this).val();
    let price_to_paid_with_partial_point = gon.product_price - used_point;
    let result_partial_point_used = '¥' + price_to_paid_with_partial_point;
    $('#data-buy-pay').html(result_partial_point_used);
  })


});