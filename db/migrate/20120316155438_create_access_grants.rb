class CreateAccessGrants < ActiveRecord::Migration
  def self.up
    create_table :access_grants do |t|
      t.string :code
      t.string :access_token
      t.string :refresh_token
      t.datetime :access_token_expires_at
      t.integer :user_id
      t.integer :app_id

      t.timestamps
    end
    
    add_index :access_grants, :user_id
    add_index :access_grants, :app_id
  end

  def self.down
    drop_table :access_grants
  end
end
