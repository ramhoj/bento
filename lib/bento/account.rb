module Bento::Account
  def self.included(base)
    base.class_eval do
      attr_accessor :first_name, :last_name, :email
      attr_accessor :password, :password_confirmation

      validates_presence_of :name
    end
  end
end