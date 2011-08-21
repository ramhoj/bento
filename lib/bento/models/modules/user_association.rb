module Bento
  module Models
    module Modules
      module UserAssociation
        def self.included(base)
          base.class_eval do
            has_many :bento_memberships
            has_many :users, :through => :bento_memberships
          end
        end
      end
    end
  end
end