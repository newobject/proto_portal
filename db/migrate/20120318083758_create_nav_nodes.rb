class CreateNavNodes < ActiveRecord::Migration
  def change
    create_table :nav_nodes do |t|
      t.string :name
      t.string :url
      t.integer :app_id
      t.timestamps
    end
  end
end
