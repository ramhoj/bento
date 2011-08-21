class AddPlanToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :plan, :string
  end

  def self.down
    remove_column :accounts, :plan
  end
end
