require 'spec_helper'

class ValidationsTestAccount < ActiveRecord::Base
  set_table_name("accounts")
  attr_accessible :name
  bento_account(:validations)
end

describe Bento::Models::Modules::Validations do
  subject { ValidationsTestAccount.new }
  it { should be_invalid_without(:name) }
  it { should_not have_user_accessors }
  it { should_not respond_to(:users) }
  it { should_not respond_to(:trial_days_remaining) }
  it { should_not respond_to(:build_user) }

  it "validates pressence of name" do
    account2 = ValidationsTestAccount.create(:name => "")
    account2.should have(1).error_on(:name)
  end

  it "validates uniquness of name" do
    account1 = ValidationsTestAccount.create!(:name => "Elabs")
    account2 = ValidationsTestAccount.create(:name => "Elabs")
    account2.should have(1).error_on(:name)
  end
end
