module Bento
  module Models
    module Account
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        USER_ACCESSORS = [:first_name, :last_name, :email, :password, :password_confirmation]

        def bento_account(*options)
          if extend_with_validations?(options)
            validates_presence_of :name
          end

          if extend_with_user_accessors?(options)
            attr_accessor *USER_ACCESSORS
          end

          if extend_with_user_association?(options)
            has_many :users
          end

          if extend_with_trial?(options)
            define_method("trial_days_remaining") do
              created_at.advance(:days => 30).to_date - Date.today
            end
          end

          if extend_with_user_association?(options) and extend_with_user_accessors?(options)
            before_validation :build_user, :on => :create

            define_method("build_user") do
              user_attributes = USER_ACCESSORS.inject({}) { |h, key| h.merge(key => send(key)) }
              if user_attributes.values.any?
                @user ||= users.build(user_attributes)
                @user.tap(&:valid?).errors.each { |attribute, message| errors.add(attribute, message) }
                @user
              end
            end
          end
        end

        private

        def method_missing(*args)
          option = args.shift.to_s.sub(/^extend_with_/, '').chop.to_sym
          available = args.flatten

          (available.is_a?(Array) and available.empty?) or available.include?(:all) or available.include?(option)
        end
      end
    end
  end
end

class ActiveRecord::Base
  include Bento::Models::Account
end