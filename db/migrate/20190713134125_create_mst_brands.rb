class CreateMstBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :mst_brands do |t|
      t.string :name, index: true
      t.timestamps
    end
  end
end
