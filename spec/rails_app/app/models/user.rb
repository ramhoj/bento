class User < ActiveRecord::Base
  devise :database_authenticatable, :validatable
  # Also available: :token_authenticatable, :confirmable, :lockable,
  # :timeoutable :registerable, :trackable, :rememberable, :recoverable

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :account

  belongs_to :site
  has_many :memberships
  has_many :accounts, :through => :memberships

  def account
    accounts.first
  end

  def account=(account)
    accounts.each(&:destroy)
    self.accounts << account
  end
end
