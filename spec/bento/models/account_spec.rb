require 'spec_helper'

class Bento::AccountTest < ActiveRecord::Base
  set_table_name("accounts")
  attr_accessible :name, :plan, :first_name, :last_name, :email, :password_confirmation, :password, :created_at
end
class NoOptionsTestAccount < Bento::AccountTest;                bento_account;                                     end
class AllTestAccount < Bento::AccountTest;                      bento_account(:all);                               end
class ValidationsTestAccount < Bento::AccountTest;              bento_account(:validations);                       end
class UserAccessorsTestAccount < Bento::AccountTest;            bento_account(:user_accessors);                    end
class UserAssociationTestAccount < Bento::AccountTest;          bento_account(:user_association);                  end
class AllUserTestAccount < Bento::AccountTest;                  bento_account(:user_accessors, :user_association); end
class ServeralOptionsAccessorsTestAccount < Bento::AccountTest; bento_account(:user_accessors, :validations);      end
class TrialTestAccount < Bento::AccountTest;                    bento_account(:trial);                             end

describe Bento::Models::Account do
  let(:account_params) do
    { :name => "Hashrocket", :first_name => "Obie", :last_name => "Fernandez", :email => "obie@hashrocket.com", :password => "test1234" }
  end

  context "all" do
    subject { AllTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should respond_to(:users) }
    it { should respond_to(:trial_days_remaining) }
    it { should respond_to(:build_user) }

    describe ".build_user" do
      context "all user attributes are blank" do
        it "creates the account without the user" do
          account = AllTestAccount.new(:name => "Elabs")
          account.save.should be_true
          User.find_by_account_id(account.id).should be_nil
        end
      end

      context "at least one user attributes is present" do
        context "successfully creating a user" do
          subject do
            account = AllTestAccount.create!(account_params)
            account.users.first
          end

          its(:email) { should == "obie@hashrocket.com" }
          its(:first_name) { should == "Obie" }
          its(:last_name) { should == "Fernandez" }
        end

        context "unsuccessfully creating a user" do
          subject { AllTestAccount.new(account_params.merge(:email => "")).tap(&:valid?) }
          it { subject.errors.should include(:email) }
        end
      end
    end

    describe "#trial_days_remaining" do
      subject { TrialTestAccount.create!(:name => "Account", :created_at => 6.days.ago).trial_days_remaining }
      it("returns the number of days that are left in the trial") { should == 24 }
    end
  end

  context "no options" do
    subject { NoOptionsTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should respond_to(:users) }
    it { should respond_to(:trial_days_remaining) }
    it { should respond_to(:build_user) }
  end

  context "validations" do
    subject { ValidationsTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should_not have_user_accessors }
    it { should_not respond_to(:users) }
    it { should_not respond_to(:trial_days_remaining) }
    it { should_not respond_to(:build_user) }
  end

  context "user accessors" do
    subject { UserAccessorsTestAccount.new }
    it { should_not be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should_not respond_to(:users) }
    it { should_not respond_to(:trial_days_remaining) }
    it { should_not respond_to(:build_user) }
  end

  context "several options" do
    subject { ServeralOptionsAccessorsTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should_not respond_to(:users) }
    it { should_not respond_to(:trial_days_remaining) }
    it { should_not respond_to(:build_user) }
  end

  context "user association" do
    subject { UserAssociationTestAccount.new }
    it { should_not be_invalid_without(:name) }
    it { should_not have_user_accessors }
    it { should respond_to(:users) }
    it { should_not respond_to(:trial_days_remaining) }
    it { should_not respond_to(:build_user) }
  end

  context "trial" do
    subject { TrialTestAccount.new }
    it { should_not be_invalid_without(:name) }
    it { should_not have_user_accessors }
    it { should_not respond_to(:users) }
    it { should respond_to(:trial_days_remaining) }
    it { should_not respond_to(:build_user) }
  end

  context "user accessors and user association" do
    subject { AllUserTestAccount.new }
    it { should_not be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should respond_to(:users) }
    it { should_not respond_to(:trial_days_remaining) }
    it { should respond_to(:build_user) }
  end
end