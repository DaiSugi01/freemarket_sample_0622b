crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_index_path
  parent :root
end

crumb :sell_product do
  link "出品した商品 - 出品中", sell_product_mypage_index_path
  parent :mypage
end

crumb :tbl_profile do
  link "プロフィール", edit_tbl_profile_path(current_tbl_user.tbl_profile.id)
  parent :mypage
end

crumb :tbl_address do
  link "本人情報確認", edit_tbl_address_path(current_tbl_user.tbl_addresses[0].id)
  parent :mypage
end

crumb :signout do
  link "ログアウト", signout_mypage_index_path
  parent :mypage
end

crumb :cards do
  link "支払い方法", cards_path
  parent :mypage
end

