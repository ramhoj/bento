require 'spec_helper'

class Bento::AccountTest < ActiveRecord::Base;                  set_table_name("accounts");           end
class NoOptionsTestAccount < Bento::AccountTest;                bento_account;                        end
class AllTestAccount < Bento::AccountTest;                      bento_account(:all);                  end
class ServeralOptionsAccessorsTestAccount < Bento::AccountTest; bento_account(:trial, :validations);  end

describe Bento::Models::Account do
  context "all" do
    subject { AllTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should have_user_accessors }
    it { should respond_to(:users) }
    it { should respond_to(:trial_days_remaining) }
    it { should respond_to(:build_user) }
  end

  context "no options" do
    subject { NoOptionsTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should_not have_user_accessors }
    it { should respond_to(:users) }
    it { should_not respond_to(:trial_days_remaining) }
    it { should_not respond_to(:build_user) }
  end

  context "several options" do
    subject { ServeralOptionsAccessorsTestAccount.new }
    it { should be_invalid_without(:name) }
    it { should_not have_user_accessors }
    it { should_not respond_to(:users) }
    it { should respond_to(:trial_days_remaining) }
    it { should_not respond_to(:build_user) }
  end
end