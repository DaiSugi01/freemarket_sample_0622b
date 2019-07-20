class ChangeDataDescriptionToTblProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :tbl_products, :description, :text
  end
end
