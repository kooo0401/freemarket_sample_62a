$(function(){
  if ( gon.selected_size == null ){
    $('.exhibitmain__details__size-name').hide();
    $('#product_size_id').hide();
    $('#product_size_id').html("");
  }
  var current_delivery_charged_status = $('.exhibitmain__delivery__burden__box1').val();
  if ( current_delivery_charged_status == "shipping_fee_on_shipper"){
    $('.exhibitmain__delivery__way-box1').children('option[value="rakuraku_mercari_bin"]').remove();
    $('.exhibitmain__delivery__way-box1').children('option[value="letter_pack"]').remove();
    $('.exhibitmain__delivery__way-box1').children('option[value="normal"]').remove();
    $('.exhibitmain__delivery__way-box1').children('option[value="clickpost"]').remove();
  }


  $(function(){
    var maxNum = 1000000; // 注文できる金額の上限
    var tagInput = $('#pricebox'); // 入力対象のinputタグID名
    var tagOutput = $('#priceboxa'); // 出力対象のinputタグID名
    tagInput.on('keyup', function() {
    var str = $(this).val();
    var num = Number(str.replace(/[^0-9]/g, '')); // 整数以外の文字列を削除
     if(num == 0) {
        num = '';
      } else if (num > maxNum) { // 上限を超える金額を入力した場合
        num = maxNum;
      }
      $(this).val(num);
      if(num < 300){
        $('#priceboxb').html('');
        $('#priceboxa').html('');
      }
      else if(num > 300) {
        var p = Math.floor(num*0.1);
        var price = '¥' + p.toLocaleString();
        tagOutput.html(price);
      } 
      });
    });

  $(function(){
    var maxNum = 1000000; // 注文できる金額の上限
    var tagInput = $('#pricebox'); // 入力対象のinputタグID名
    var tagOutput = $('#priceboxb'); // 出力対象のinputタグID名
    tagInput.on('keyup', function() {
    var str = $(this).val();
    var num = Number(str.replace(/[^0-9]/g, '')); // 整数以外の文字列を削除
   
      if(num == 0) {
        num = '';
      } else if (num > maxNum) { // 上限を超える金額を入力した場合
        num = maxNum;
      }
      $(this).val(num);
        if(num > 300) {
        var p = Math.floor(num*0.9);
        var price = '¥' + p.toLocaleString();
        tagOutput.html(price);
      } 
      });
      });


$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".exhibitmain__upbox__imagebox1");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});

  // 配送方法のJSの実装
  $('.exhibitmain__delivery__burden__box1').change(function() {
      var delivery_charged_status = $('.exhibitmain__delivery__burden__box1').val();
      if(delivery_charged_status == "---") {
          $('.exhibitmain__delivery__way').hide();
          $('.exhibitmain__delivery__way-box').hide();
          $('.exhibitmain__delivery__way-box1').children('option[value="rakuraku_mercari_bin"]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value="letter_pack"]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value="normal"]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value="clickpost"]').remove();
      }else if(delivery_charged_status == "shipping_fee_on_shipper") {
          $('.exhibitmain__delivery__way-box1').val('0');
          $('.exhibitmain__delivery__way').show();
          $('.exhibitmain__delivery__way-box').show();
          $('.exhibitmain__delivery__way-box1').children('option[value="rakuraku_mercari_bin"]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value="letter_pack"]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value="normal"]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value="clickpost"]').remove();
      }else if(delivery_charged_status == "shipping_fee_on_receiver") {
          $('.exhibitmain__delivery__way-box1').val('0');
          $('.exhibitmain__delivery__way').show();
          $('.exhibitmain__delivery__way-box').show();
          $('.exhibitmain__delivery__way-box1').append('<option value="rakuraku_mercari_bin">らくらくメルカリ便</option>','<option value="letter_pack">レターパック</option>','<option value="normal">普通郵便（定型、定型外)</option>','<option value="clickpost">クリックポスト</option>');
      }
  });
});



$(function(){
  $('#product_parent_id').change(function() {
    var parent_id = $('#product_parent_id').val();
    $.ajax({
      type: 'POST',
      url: '../../../../api/products',
      data: {id : parent_id},
      dataType: 'json',
    })
    .done(function(data){
      var obj = data;
      $('#product_child_id').html("");
      $('.exhibitmain__details__size-name').hide();
      $('#product_size_id').hide();
      $('#product_size_id').val('');
      $('#product_category_id').hide();
      $('#product_child_id').show();
      $('#product_child_id').append('<option value="0">---</option>');
      for(var i=0;i<obj.length;i++){
        $('#product_child_id').append("<option value=" + obj[i].id+">"+obj[i].name+"</option>");
      }

    })
    .fail(function(){
      alert('error');
    })
  });
  $('#product_child_id').change(function() {
    var child_id = $('#product_child_id').val();
    $.ajax({
      type: 'POST',
      url: '../../../../api/products2',
      data: {id : child_id},
      dataType: 'json',
    })
    .done(function(data){
      var obj2 = data;
      $('#product_category_id').html("");
      $('.exhibitmain__details__size-name').hide();
      $('#product_size_id').hide();
      $('#product_size_id').val('');
      $('#product_category_id').show();
      $('#product_category_id').append('<option value="0">---</option>');
      for(var i=0;i<obj2.length;i++){
        $('#product_category_id').append("<option value=" + obj2[i].id+">"+obj2[i].name+"</option>");
      }
    })
    .fail(function(){
      alert('error');
    })
  })
    $('#product_category_id').change(function() {
      var grandchild_id = $('#product_category_id').val();
      $.ajax({
        type: 'POST',
        url: '../../../../api/products3',
        data: {id : grandchild_id},
        dataType: 'json',
      })
      .done(function(data){
        var obj3 = data;
        $('#product_size_id').html("");
        if( data.length != 0 ){
        $('.exhibitmain__details__size-name').show();
        $('#product_size_id').show();
        $('#product_size_id').append('<option value="0">---</option>');
        for(var i=0;i<obj3.length;i++){
          $('#product_size_id').append("<option value=" + obj3[i].id+">"+obj3[i].name+"</option>");
        }
      }
        else if(data.length == 0 ){
          $('.exhibitmain__details__size-name').hide();
          $('#product_size_id').hide();
          $('#product_size_id').val('');
        }
      })
      .fail(function(){
        alert('error');
      });
    });
})