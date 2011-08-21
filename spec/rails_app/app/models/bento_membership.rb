class BentoMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :account

  attr_accessible :account_id, :user_id
end
