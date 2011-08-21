module Bento
  module Models
    module Modules
      module UserAssociation
        def self.included(base)
          base.class_eval do
            has_many :memberships
            has_many :users, :through => :memberships
          end
        end
      end
    end
  end
end