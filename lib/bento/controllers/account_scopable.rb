module Bento
  module Controllers
    module AccountScopable
      def scoped_to_account(*args, &block)
        inherit_resources(*args)
        include AccountScopable::InstanceMethods
      end

      module InstanceMethods
        def begin_of_association_chain
          current_user.account
        end

        private :begin_of_association_chain
      end
    end
  end
end

class ActionController::Base
  extend Bento::Controllers::AccountScopable
end