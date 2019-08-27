class CreateTblCards < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_cards do |t|
      t.string :brand, null: false
      t.string :expire_month, null: false
      t.string :expire_year, null: false
      t.string :last_four_number, null: false
      t.string :token, null: false
      t.references :tbl_user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
