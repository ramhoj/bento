Dir["#{File.expand_path(File.dirname(__FILE__))}/modules/*.rb"].each {|f| require f}

module Bento
  module Models
    module Account
      DEFAULT_MODULES = %w[validations user_association]
      ALL_MODULES = DEFAULT_MODULES + %w[trial user_accessors]

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def bento(*modules)
          module_names(modules).each { |name| include account_module(name) }
        end

        private

        def module_names(modules)
          if modules.include?(:all)
            ALL_MODULES
          elsif modules.empty?
            DEFAULT_MODULES
          else
            modules
          end
        end

        def account_module(name)
          "Bento::Models::Modules::#{name.to_s.camelcase}".constantize
        end
      end
    end
  end
end

class ActiveRecord::Base
  include Bento::Models::Account
end