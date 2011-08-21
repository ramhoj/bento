require 'rails/generators/active_record'
require 'generators/bento/orm_helpers'

module ActiveRecord
  module Generators
    class BentoGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      include Bento::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists?
        create_file "app/models/membership.rb", membership_model_content
      end

      def copy_bento_migration
        migration_template "create_migration.rb", "db/migrate/bento_create_#{table_name}"
        migration_template "membership_migration.rb", "db/migrate/bento_create_memberships"
      end

      def inject_bento_content
        inject_into_class model_path, class_name, model_contents
        inject_into_class user_path, "User", user_model_content
        inject_into_class membership_path, "Membership", membership_model_content
      end
    end
  end
end
