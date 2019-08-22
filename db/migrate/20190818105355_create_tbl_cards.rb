class CreateTblCards < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_cards do |t|
      t.string :token, null: false
      t.references :tbl_user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
