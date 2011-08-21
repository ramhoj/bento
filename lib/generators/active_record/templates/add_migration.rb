class BentoAdd<%= name.classify %>IdTo<%= name.classify %>s < ActiveRecord::Migration
  def self.up
    add_column :users, :<%= name %>_id, :integer
  end

  def self.down
    remove_column :users, :column_name
  end
end