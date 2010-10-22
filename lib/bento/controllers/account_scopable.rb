module Bento
  module Controllers
    module AccountScopable
      def scoped_to_account(*args, &block)
        inherit_resources(*args)
        include AccountScopable::InstanceMethods
      end

      module InstanceMethods
        private

        def begin_of_association_chain
          @account ||= current_account
        end

        def current_account
          if not_responding_to_admin? or admin?
            account_by_param_or_session
          else
            current_user.account
          end
        end

        def admin?
          respond_to_admin? and current_user.admin?
        end

        def not_responding_to_admin?
          (not respond_to_admin?)
        end

        def respond_to_admin?
          current_user.respond_to?(:admin?)
        end

        def account_by_param_or_session
          if account_id then Account.find(account_id) else current_user.account end
        end

        def account_id
          key, value = params.find { |key, value| key.to_s.ends_with?("account_id") }
          value
        end
      end
    end
  end
end

class ActionController::Base
  extend Bento::Controllers::AccountScopable
end