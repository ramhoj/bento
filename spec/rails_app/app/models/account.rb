class Account < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :email
  attr_accessor :password, :password_confirmation

  validates_presence_of :name
end
