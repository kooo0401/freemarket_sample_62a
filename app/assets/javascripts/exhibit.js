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
      if(num > 300) {
        var p = Math.floor(num*0.1);
        var price = '¥' + p;
        tagOutput.val(price);
      } 
        // inputらんが０なら空にする
      
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
        tagOutput.val(price);
      } 
      });
      });
// $(function(){
//   //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
//   $('form').on('change', 'input[type="file"]', function(e) {
//     var file = e.target.files[0],
//         reader = new FileReader(),
//         $preview = $(".preview");
//         t = this;

//     // 画像ファイル以外の場合は何もしない
//     if(file.type.indexOf("image") < 0){
//       return false;
//     }

//     // ファイル読み込みが完了した際のイベント登録
//     reader.onload = (function(file) {
//       return function(e) {
//         //既存のプレビューを削除
//         $preview.empty();
//         // .prevewの領域の中にロードした画像を表示するimageタグを追加
//         $preview.append($('<img>').attr({
//                   src: e.target.result,
//                   width: "150px",
//                   class: "preview",
//                   title: file.name
//               }));
//       };
//     })(file);

//     reader.readAsDataURL(file);
//   });
// });
//     $(function(){
//       //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
//       $('form').on('change', 'input[type="file"]', function(e) {
//         var file = e.target.files[0],
//             reader = new FileReader(),
//             $preview = $(".preview");
//             t = this;

//         // 画像ファイル以外の場合は何もしない
//         if(file.type.indexOf("image") < 0){
//           return false;
//         }

//         // ファイル読み込みが完了した際のイベント登録
//         reader.onload = (function(file) {
//           return function(e) {
//             //既存のプレビューを削除
//             $preview.empty();
//             // .prevewの領域の中にロードした画像を表示するimageタグを追加
//             $preview.append($('<img>').attr({
//                       src: e.target.result,
//                       width: "150px",
//                       class: "preview",
//                       title: file.name
//                   }));
//           };
//         })(file);
//     reader.readAsDataURL(file);
//   });
// });

//   $(function(){
//       $('#file').change(function(){
//           $('img').remove();
//           var file = $(this).prop('files')[0];
//           if(!file.type.match('image.*')){
//               return;
//           }
//           var fileReader = new FileReader();
//           fileReader.onloadend = function() {
//               $('#result').html('<img src="' + fileReader.result + '"/>');
//           }
//           fileReader.readAsDataURL(file);
//       });
//   });










// $(function(){
//   // $('preview-1').css("width", "100px");
//   //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  
//   $('form').on('change', 'input[type="file"]', function(e) {
//     // $('.preview-1').css('width', '100px');
//     var file = e.target.files[0],
//         reader = new FileReader(),
//         $preview = $(".preview-1");
//         t = this;
  
//     // 画像ファイル以外の場合は何もしない
//     if(file.type.indexOf("image") < 0){
//       return false;
//     }
    
//     // ファイル読み込みが完了した際のイベント登録
//     reader.onload = (function(file) {
//       return function(e) {
//         //既存のプレビューを削除
//         $preview.empty();
//         // .prevewの領域の中にロードした画像を表示するimageタグを追加
//         $preview.append($('<img>').attr({
//                   src: e.target.result,
//                   width: "150px",
//                   class: "preview-1",
//                   title: file.name
//               }));
//               $('.preview-1').css('width', '100px');
//       };
//     })(file);
//   });
// });
    // reader.readAsDataURL(file);
  // });
//   //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  
//   $('form').on('change', 'input[type="file"]', function(e) {
//     var file = e.target.files[1],
//         readers = new FileReader(),
//         $preview = $(".preview-2");
//         t = this;

//     // 画像ファイル以外の場合は何もしない
//     if(file.type.indexOf("image") < 0){
//       return false;
//     }

//     // ファイル読み込みが完了した際のイベント登録
//     readers.onload = (function(file) {
//       return function(e) {
//         //既存のプレビューを削除
//         $preview.empty();
//         // .prevewの領域の中にロードした画像を表示するimageタグを追加
//         $preview.append($('<img>').attr({
//                   src: e.target.result,
//                   width: "150px",
//                   class: "preview-2",
//                   title: file.name
//               }));
//               $('.preview-2').css('width', '100px');
//               // $('.preview-1').css('left', '100px');
//       };
//     })(file);

//     readers.readAsDataURL(file);
//   });
// });

// $(function() {
//   var file = e.target.files[0],
//       reader = new FileReader(),
//       $preview = $(".preview-2");
//       t = this;
//   reader.onload = (function(file) {
//     return function(e) {
//       //既存のプレビューを削除
//       $preview.empty();
//       // .prevewの領域の中にロードした画像を表示するimageタグを追加
//       $preview.append($('<img>').attr({
//                 src: e.target.result,
//                 width: "150px",
//                 class: "preview-1",
//                 title: file.name
//             }));
//           }
//           })
//   readers.readAsDataURL(file);
// })



  $('.exhibitmain__delivery__burden__box1').change(function() {
      var a = $('.exhibitmain__delivery__burden__box1').val();
      if(a == "0") {
          $('.exhibitmain__delivery__way').hide();
          $('.exhibitmain__delivery__way-box').hide();
          $('.exhibitmain__delivery__way2').hide();
          $('.exhibitmain__delivery__way-box2').hide();
      }else if(a == "1") {
          $('.exhibitmain__delivery__way').show();
          $('.exhibitmain__delivery__way-box').show();
          $('.exhibitmain__delivery__way2').hide();
          $('.exhibitmain__delivery__way-box2').hide();
      }else if(a == "2") {
          $('.exhibitmain__delivery__way').hide();
          $('.exhibitmain__delivery__way-box').hide();
          $('.exhibitmain__delivery__way2').show();
          $('.exhibitmain__delivery__way-box2').show();
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
