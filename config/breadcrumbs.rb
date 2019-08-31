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

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).