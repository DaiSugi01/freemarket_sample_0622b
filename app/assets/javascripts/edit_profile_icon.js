// プロフィール編集画面　画像ファイル選択欄の表示切り替え
function change_display(){
    $('.container__right__profile__icon').on('click', function(){
        $('.container__right__profile__file').removeClass('not_display');
    });
}

$(window).on('load', function(){
    change_display();
});
