function transaction(){
    $('.transactions').on('click', '.transactions__list--not-active', function(){
        // タブの切り替え
        $(event.target).parent().removeClass('transactions__list--not-active');
        $(event.target).parent().addClass('transactions__list');

        $(event.target).parent().siblings().removeClass('transactions__list');
        $(event.target).parent().siblings().addClass('transactions__list--not-active');

        // 選択したタブに対応するコンテンツの表示切り替え
        var type = $(event.target).parent().attr('data-type');
        $('.container__right__list[data-type="' + type + '"]').removeClass('not_active');
        $('.container__right__list[data-type="' + type + '"]').siblings('ul.container__right__list').addClass('not_active');

    });
}

$(window).on('load', function(){
    transaction();
});