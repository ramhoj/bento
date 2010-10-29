require 'spec_helper'

class AccountController < ActionController::Base; end

describe Bento::Controllers::Helpers do
  subject { AccountController.new }

  describe "#current_account" do
    let(:account) { Account.make }
    let(:user) { User.make(:account => account) }
    before { subject.stubs(:current_user).returns(user) }

    it "returns the current users account" do
      subject.current_account.should == account
    end
  end
end
