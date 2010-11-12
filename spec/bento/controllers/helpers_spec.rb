require 'spec_helper'

class AccountController < ActionController::Base; end

describe Bento::Controllers::Helpers do
  subject { AccountController.new }
  let(:account) { Account.make }
  let(:site) { Site.make }
  let(:user) { User.make(:account => account, :site => site) }

  before do
    AccountController.send(:include, Bento::Controllers::Helpers)
    subject.stubs(:current_user).returns(user)
  end

  describe ".define_helpers" do
    it "defines the method current_<resource>" do
      Bento::Controllers::Helpers.define_helpers(:site)
      subject.current_site.should == site
    end
  end

  describe "#current_account" do
    it "returns the current users account" do
      subject.current_account.should == account
    end
  end
end
