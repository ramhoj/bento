class Account < ActiveRecord::Base
  # Include all bento modules. Others available are:
  # :all, :validations, :user_accessors, :user_association, :user_accessors, :trial
  bento :all

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :plan, :first_name, :last_name, :email, :password_confirmation, :password

  has_many :projects
end
