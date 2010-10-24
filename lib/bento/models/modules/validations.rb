module Bento
  module Models
    module Modules
      module Validations
        def self.included(base)
          base.class_eval do
            validates_presence_of :name
            validates_uniqueness_of :name, :allow_blank => true
          end
        end
      end
    end
  end
end