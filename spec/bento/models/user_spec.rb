require 'spec_helper'

describe Bento::Models::User do
  describe ".fake_belongs_to" do
    let(:user) { User.make }
    let(:account) { Account.make }
    before do
      User.class_eval { fake_belongs_to(:account) }
      user.accounts << account
    end

    it "defines #account" do
      user.account.should == account
    end

    it "defines #account=" do
      other_account = Account.make
      user.account = other_account

      user.reload.account.should == other_account
      user.accounts.length.should == 1
    end
  end
end