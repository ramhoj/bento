module Bento::Account
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def bento_account(*options)
      @options = options

      if all? or @options.include?(:validations)
        validates_presence_of :name
      end

      if all? or @options.include?(:user_accessors)
        attr_accessor :first_name, :last_name, :email
        attr_accessor :password, :password_confirmation
      end
    end

    private

    def all?
      @options.include?(:all)
    end
  end
end

class ActiveRecord::Base
  include Bento::Account
end