class CreateMstMajorCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :mst_major_categories do |t|
      t.string :name, null: false, index: true
      t.timestamps
    end
  end
end
