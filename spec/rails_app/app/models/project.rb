class Project < ActiveRecord::Base
  attr_accessible :name, :account_id
  belongs_to :account
end
