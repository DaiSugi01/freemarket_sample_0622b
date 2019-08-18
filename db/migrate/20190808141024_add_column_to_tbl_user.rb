class AddColumnToTblUser < ActiveRecord::Migration[5.2]
  def up
    add_column :tbl_users, :provider, :string
    add_column :tbl_users, :uid, :string
  end

  def down
    remove_column :tbl_users, :provider
    remove_column :tbl_users, :uid
  end
end
