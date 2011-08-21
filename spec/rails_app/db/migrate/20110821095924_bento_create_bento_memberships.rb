class BentoCreateBentoMemberships < ActiveRecord::Migration
  def self.up
    create_table :bento_memberships do |t|
      t.integer :account_id
      t.integer :user_id
      t.timestamps
    end

    add_index :bento_memberships, [:account_id, :user_id], :unique => true

    # If you know for sure that you don't want to be able
    # to have users that belongs to several accounts
    # please remove the above lines and uncomment the lines below

    # add_column :users, :account_id, :integer
    # add_index :users, :account_id
  end

  def self.down
    drop_table :bento_memberships

    # remove_column :users, :account_id
    # remove_index :users, :account_id
  end
end