module Bento
  module Controllers
    # Those helpers are convenience methods added to ApplicationController.
    module Helpers
      def self.included(base)
        base.helper_method :current_account
      end

      def current_account
        current_user.account if current_user
      end
    end
  end
end