class CreateTblAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_addresses do |t|
      t.string :full_name, null: false
      t.string :full_name_kana, null: false
      t.integer :zip, null: false
      t.references :mst_prefecture
      t.string :address, null: false
      t.string :phone, null: false
      t.references :tbl_user
      t.timestamps
    end
  end
end
