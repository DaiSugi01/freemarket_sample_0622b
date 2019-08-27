class CreateTblBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_buyers do |t|
      t.references :tbl_user, null: false, foreign_key: true
      t.references :tbl_product, null: false, foreign_key: true
      t.references :mst_correspondence, null: false, foreign_key: true
      t.timestamps
    end
  end
end
