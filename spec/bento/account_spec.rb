require 'spec_helper'

class Bento::AccountTest < ActiveRecord::Base;                  set_table_name("accounts");                        end
class NoOptionsTestAccount < Bento::AccountTest;                bento_account;                                     end
class AllTestAccount < Bento::AccountTest;                      bento_account(:all);                               end
class ValidationsTestAccount < Bento::AccountTest;              bento_account(:validations);                       end
class UserAccessorsTestAccount < Bento::AccountTest;            bento_account(:user_accessors);                    end
class UserAssociationTestAccount < Bento::AccountTest;          bento_account(:user_association);                  end
class AllUserTestAccount < Bento::AccountTest;                  bento_account(:user_accessors, :user_association); end
class ServeralOptionsAccessorsTestAccount < Bento::AccountTest; bento_account(:user_accessors, :validations);      end

describe Bento::Account do
  context "all" do
    subject { AllTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should respond_to(:users) }
  end

  context "no options" do
    subject { NoOptionsTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should respond_to(:users) }
  end

  context "validations" do
    subject { ValidationsTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should_not have_user_accessors }
    it { should_not respond_to(:users) }
  end

  context "user accessors" do
    subject { UserAccessorsTestAccount.new }
    it { should_not be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should_not respond_to(:users) }
  end

  context "several options" do
    subject { ServeralOptionsAccessorsTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should_not respond_to(:users) }
  end

  context "user association" do
    subject { UserAssociationTestAccount.new }
    it { should_not be_invalid_without(:name) }
    it { should_not have_user_accessors }
    it { should respond_to(:users) }
  end
end