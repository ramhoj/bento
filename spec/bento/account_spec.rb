require 'spec_helper'

class Bento::AccountTest < ActiveRecord::Base;                  set_table_name("accounts");                   end
class NoOptionsTestAccount < Bento::AccountTest;                bento_account;                                end
class AllTestAccount < Bento::AccountTest;                      bento_account(:all);                          end
class ValidationsTestAccount < Bento::AccountTest;              bento_account(:validations);                  end
class UserAccessorsTestAccount < Bento::AccountTest;            bento_account(:user_accessors);               end
class ServeralOptionsAccessorsTestAccount < Bento::AccountTest; bento_account(:user_accessors, :validations); end

# TODO: create rspec matchers to dry this up
describe Bento::Account do
  context "all" do
    subject { AllTestAccount.new.tap(&:valid?) }
    it { subject.errors.should include(:name) }

    it "has the user accessors" do
      should respond_to(:first_name)
      should respond_to(:last_name)
      should respond_to(:email)
      should respond_to(:password)
      should respond_to(:password_confirmation)
    end
  end

  context "no options" do
    subject { NoOptionsTestAccount.new.tap(&:valid?) }
    it { subject.errors.should include(:name) }

    it "has the user accessors" do
      should respond_to(:first_name)
      should respond_to(:last_name)
      should respond_to(:email)
      should respond_to(:password)
      should respond_to(:password_confirmation)
    end
  end

  context "validations" do
    subject { ValidationsTestAccount.new.tap(&:valid?) }
    it { subject.errors.should include(:name) }

    it "doesn't have the user accessors" do
      should_not respond_to(:first_name)
      should_not respond_to(:last_name)
      should_not respond_to(:email)
      should_not respond_to(:password)
      should_not respond_to(:password_confirmation)
    end
  end

  context "UserAccessorsTestAccount" do
    subject { UserAccessorsTestAccount.new }

    it "has the user accessors" do
      should respond_to(:first_name)
      should respond_to(:last_name)
      should respond_to(:email)
      should respond_to(:password)
      should respond_to(:password_confirmation)
    end
  end

  context "ServeralOptionsAccessorsTestAccount" do
    subject { ServeralOptionsAccessorsTestAccount.new.tap(&:valid?) }
    it { subject.errors.should include(:name) }

    it "has the user accessors" do
      should respond_to(:first_name)
      should respond_to(:last_name)
      should respond_to(:email)
      should respond_to(:password)
      should respond_to(:password_confirmation)
    end
  end
end