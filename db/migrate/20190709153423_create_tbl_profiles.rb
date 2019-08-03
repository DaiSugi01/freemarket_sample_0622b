class CreateTblProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :tbl_profiles do |t|
      t.string :nickname, null: false
      t.string :icon
      t.text :description
      t.references :tbl_user
      t.timestamps
    end
  end
end
