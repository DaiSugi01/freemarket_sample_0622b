class AddTblUsersIdToTblProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :tbl_products, :tbl_user, foreign_key: true
  end
end
