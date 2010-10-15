module Bento
  module Controllers
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

class ActionController::Base
  include Bento::Controllers::Helpers
end