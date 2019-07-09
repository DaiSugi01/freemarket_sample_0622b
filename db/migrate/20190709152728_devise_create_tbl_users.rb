# frozen_string_literal: true

class DeviseCreateTblUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_users do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :phone, null: false
      t.date :birthday, null: false
      t.timestamps null: false
    end

    add_index :tbl_users, :email,                unique: true
    add_index :tbl_users, :reset_password_token, unique: true
  end
end
