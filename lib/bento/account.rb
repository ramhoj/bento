module Bento::Account
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def bento_account(*options)
      if extend_with_validations?(options)
        validates_presence_of :name
      end

      if extend_with_user_accessors?(options)
        attr_accessor :first_name, :last_name, :email
        attr_accessor :password, :password_confirmation
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

class ActiveRecord::Base
  include Bento::Account
end