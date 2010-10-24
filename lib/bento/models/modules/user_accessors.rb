module Bento
  module Models
    module Modules
      module UserAccessors
        USER_ACCESSORS = [:first_name, :last_name, :email, :password, :password_confirmation]

        def self.included(base)
          base.class_eval do
            include ::Bento::Models::Modules::UserAssociation
            attr_accessor *USER_ACCESSORS
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
      end
    end
  end
end