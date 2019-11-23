$(function(){  

  $( '#acdn-button' ).click( function(){
    $( '#acdn-target' ).slideToggle() ;
  });

  $('input[name="point"]:radio').change(function(){
    let selectedval = $(this).val();
    if(selectedval == 1) {
      console.log('aaa');
      $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').removeAttr('disabled');
    }
    else {
      $('.form-box-tempolary__buy-accordion__accordion-parent__accordion-child__form-group__used-point').attr('disabled','disabled');
    }
  })



});