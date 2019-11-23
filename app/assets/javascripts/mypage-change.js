$(function() {
 $('.itembuy-gray-box2').click(function(){
  if(!confirm('本当に削除しますか？')){
    return false;
}else{
    location.href = '#';
}
});

});