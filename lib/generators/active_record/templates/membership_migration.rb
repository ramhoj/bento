class BentoCreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :<%= name %>_id
      t.integer :user_id
      t.timestamps
    end

    add_index :memberships, [:<%= name %>_id, :user_id], :unique => true

    # If you know for sure that you don't want to be able
    # to have users that belongs to several <%= name.pluralize %>
    # please remove the above lines and uncomment the lines below

    # add_column :users, :<%= name %>_id, :integer
    # add_index :users, :<%= name %>_id
  end

  def self.down
    drop_table :memberships

    # remove_column :users, :<%= name %>_id
    # remove_index :users, :<%= name %>_id
  end
end