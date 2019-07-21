class CreateTblProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
