class CreateTblProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.references :mst_major_category,  null: false, foreign_key: true
      t.references :mst_brand, foreign_key: true
      t.references :mst_size, foreign_key: true
      t.references :mst_condition,  null: false, foreign_key: true
      t.references :mst_burden,  null: false, foreign_key: true
      t.references :mst_delivery_method, foreign_key: true
      t.references :mst_prefecture,  null: false, foreign_key: true
      t.references :mst_delivery_time,  null: false, foreign_key: true
      t.references :mst_status, foreign_key: true
      t.timestamps
    end
  end
end
