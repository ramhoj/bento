require 'spec_helper'

class UserAccessorsTestAccount < ActiveRecord::Base
  set_table_name("accounts")
  attr_accessible :name, :plan, :first_name, :last_name, :email, :password_confirmation, :password, :created_at
  bento(:user_accessors)
end

describe Bento::Models::Modules::UserAccessors do
  let(:account_params) do
    { :name => "Hashrocket", :first_name => "Obie", :last_name => "Fernandez", :email => "obie@hashrocket.com", :password => "test1234" }
  end

  subject { UserAccessorsTestAccount.new }
  it { should_not be_invalid_without(:name) }
  it { should have_user_accessors }
  it { should respond_to(:users) }
  it { should_not respond_to(:trial_days_remaining) }
  it { should respond_to(:build_user) }

  describe ".build_user" do
    context "all user attributes are blank" do
      it "creates the account without the user" do
        account = UserAccessorsTestAccount.new(:name => "Elabs")
        account.save.should be_true
        User.find_by_account_id(account.id).should be_nil
      end
    end

    context "at least one user attributes is present" do
      context "successfully creating a user" do
        subject do
          account = UserAccessorsTestAccount.create!(account_params)
          account.users.first
        end

        its(:email) { should == "obie@hashrocket.com" }
        its(:first_name) { should == "Obie" }
        its(:last_name) { should == "Fernandez" }
      end

      context "unsuccessfully creating a user" do
        subject { UserAccessorsTestAccount.new(account_params.merge(:email => "")).tap(&:valid?) }
        it { subject.errors.should include(:email) }
      end
    end
  end
end
