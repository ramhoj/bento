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
      end

      def copy_bento_migration
        migration_template "migration.rb", "db/migrate/bento_create_#{table_name}"
      end

      def inject_bento_content
        inject_into_class model_path, class_name, model_contents + <<-CONTENT
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :plan
CONTENT
      end
    end
  end
end
