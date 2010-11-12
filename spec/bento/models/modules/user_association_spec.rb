require 'spec_helper'

class UserAssociationTestAccount < ActiveRecord::Base
  set_table_name("accounts")
  attr_accessible :name, :created_at
  bento(:user_association)
end

describe Bento::Models::Modules::Trial do
  subject { UserAssociationTestAccount.new }
  it { should_not be_invalid_without(:name) }
  it { should_not have_user_accessors }
  it { should respond_to(:users) }
  it { should_not respond_to(:trial_days_remaining) }
  it { should_not respond_to(:build_user) }
end
