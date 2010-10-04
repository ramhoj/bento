class BentoCreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :plan
      t.timestamps
    end

    add_index :accounts, :name, :unique => true
  end

  def self.down
    drop_table :accounts
  end
end
