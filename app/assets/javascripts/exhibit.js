$(function() {
  
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
        var price = '¥' + p;
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
        var price = '¥' + p;
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
      var a = $('.exhibitmain__delivery__burden__box1').val();
      if(a == "0") {
          $('.exhibitmain__delivery__way').hide();
          $('.exhibitmain__delivery__way-box').hide();
          $('.exhibitmain__delivery__way-box1').children('option[value=10]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value=11]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value=12]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value=13]').remove();
          // 下記コメントは念のため記載しております 191125 髙橋
          // $('.exhibitmain__delivery__way2').hide();
          // $('.exhibitmain__delivery__way-box2').hide();
      }else if(a == "1") {
          $('.exhibitmain__delivery__way-box1').val('0');
          $('.exhibitmain__delivery__way').show();
          $('.exhibitmain__delivery__way-box').show();
          $('.exhibitmain__delivery__way-box1').children('option[value=10]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value=11]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value=12]').remove();
          $('.exhibitmain__delivery__way-box1').children('option[value=13]').remove();
          // 下記コメントは念のため記載しております 191125 髙橋
          // $('.exhibitmain__delivery__way2').hide();
          // $('.exhibitmain__delivery__way-box2').hide();
      }else if(a == "2") {
          $('.exhibitmain__delivery__way-box1').val('0');
          $('.exhibitmain__delivery__way').show();
          $('.exhibitmain__delivery__way-box').show();
          $('.exhibitmain__delivery__way-box1').append('<option value="10">らくらくメルカリ便</option>','<option value="11">レターパック</option>','<option value="12">普通郵便（定型、定型外)</option>','<option value="13">クリックポスト</option>');
          // 下記コメントは念のため記載しております 191125 髙橋
          // $('.exhibitmain__delivery__way2').show();
          // $('.exhibitmain__delivery__way-box2').show();
      }
  });

$(function()  {
  $(window).load(function(){
    $('.exhibitmain__delivery__way').hide();
    $('.exhibitmain__delivery__way-box').hide();
    $('.exhibitmain__delivery__way2').hide();
    $('.exhibitmain__delivery__way-box2').hide();
  })
});
});
