require 'rails/generators/active_record'

class BentoGenerator < ActiveRecord::Generators::Base
  argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

  source_root File.expand_path("../templates", __FILE__)

  def generate_model
    invoke "active_record:model", ["account"], :migration => false unless defined? Account
  end

  def copy_bento_migration
    migration_template "migration.rb", "db/migrate/bento_create_accounts"
  end
end
