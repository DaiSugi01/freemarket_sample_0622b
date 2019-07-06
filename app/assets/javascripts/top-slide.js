$(document).on('turbolinks:load', function() {

  $('.slider__bx').bxSlider({
    auto: true,           // 自動スライド
    speed: 800,           // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 5000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数
    slideWidth: 1280,     // 各スライドの幅
    autoHover: true       // ホバー時に自動スライドを停止
  });
});
