class BentoCreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.string :plan
      t.timestamps
    end

    add_index :sites, :name, :unique => true
  end

  def self.down
    drop_table :sites
  end
end
