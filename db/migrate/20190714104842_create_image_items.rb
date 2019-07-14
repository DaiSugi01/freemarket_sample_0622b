class CreateImageItems < ActiveRecord::Migration[5.2]
  def change
    create_table :image_items do |t|
      t.string     :image, null:false
      t.references :item, null:false,foreign_key: true
      t.timestamps
    end
  end
end
