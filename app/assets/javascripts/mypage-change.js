$(function(){
$('.itembuy-gray-box2').click(function(){
  $('#buy-overlay').fadeIn();
  $('haml, body').css('overflow', 'hidden');
});
$('#buy-modal-close-btn').click(function(){
  $('#buy-overlay').hide();
  $('haml, body').css('overflow', 'auto');
});
});
