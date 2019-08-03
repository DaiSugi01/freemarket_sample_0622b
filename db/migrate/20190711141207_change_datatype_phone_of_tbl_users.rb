class ChangeDatatypePhoneOfTblUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :tbl_users, :phone, :string
  end
end
