class CreateMstStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :mst_statuses do |t|
      t.string :name, null: false, index: true
      t.timestamps
    end
  end
end
