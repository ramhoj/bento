class Account < ActiveRecord::Base
  # Include all bento modules. Others available are:
  # :all, :validations, :user_accessors, :user_association, :user_accessors, :trial
  bento_account

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :plan
end
