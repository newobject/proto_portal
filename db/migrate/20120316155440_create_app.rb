class CreateApp < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.string :name
      t.string :domain
      t.string :code
      t.string :secret

      t.timestamps
    end
  end

  def self.down
    drop_table :apps
  end
end
