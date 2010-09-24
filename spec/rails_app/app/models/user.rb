class User < ActiveRecord::Base
  devise :database_authenticatable
  # Also available: :token_authenticatable, :confirmable, :lockable,
  # :timeoutable :registerable, :trackable, :rememberable, :recoverable,
  # :validatable

  attr_accessible :email, :password, :password_confirmation
end
