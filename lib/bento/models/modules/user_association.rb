module Bento
  module Models
    module Modules
      module UserAssociation
        def self.included(base)
          base.class_eval do
            has_many :users
          end
        end
      end
    end
  end
end