class User < ActiveRecord::Base
  devise :database_authenticatable, :validatable

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :account

  belongs_to :site
  has_many :bento_memberships
  has_many :accounts, :through => :bento_memberships
  fake_belongs_to :account

  def projects
    Project.where(:account_id => accounts.map(&:id))
  end
end
