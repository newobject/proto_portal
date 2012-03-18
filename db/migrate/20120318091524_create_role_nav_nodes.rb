class CreateRoleNavNodes < ActiveRecord::Migration
  def change
    create_table :role_nav_nodes do |t|
      t.integer :role_id
      t.integer :nav_node_id
      t.timestamps
    end
  end
end
