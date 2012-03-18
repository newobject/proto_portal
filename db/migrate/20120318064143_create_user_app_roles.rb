class CreateUserAppRoles < ActiveRecord::Migration
  def change
    create_table :user_app_roles do |t|
      t.integer :user_id
      t.integer :app_id
      t.integer :role_id
      t.timestamps
    end
    
    add_index :user_app_roles, :user_id
    add_index :user_app_roles, :app_id
    add_index :user_app_roles, :role_id
  end
end
