class BentoCreate<%= name.classify %>s < ActiveRecord::Migration
  def self.up
    create_table :<%= name.pluralize %> do |t|
      t.string :name
<% for attribute in attributes -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
      t.timestamps
    end

    add_index :<%= name.pluralize %>, :name, :unique => true
  end

  def self.down
    drop_table :<%= name.pluralize %>
  end
end
