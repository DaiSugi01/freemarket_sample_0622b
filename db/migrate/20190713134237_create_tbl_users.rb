class CreateTblUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_users do |t|
      t.string :last_name, null: false, index: true
      t.string :first_name, null: false, index: true
      t.string :first_name_kana, null: false, index: true
      t.string :last_name_kana, null: false, index: true
      t.string :mail, null: false, index: true
      t.string :password, null: false, index: true
      t.integer :phone, null: false, index: true
      t.datetime :birthday, null: false, index: true
      t.timestamps
    end
  end
end
