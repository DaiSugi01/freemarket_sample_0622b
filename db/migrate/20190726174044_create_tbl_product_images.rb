class CreateTblProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_product_images do |t|
      t.string :image, null:false
      t.references :tbl_product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
