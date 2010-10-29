require 'spec_helper'

class AccountController < ActionController::Base; end

describe Bento::Controllers::Helpers do
  subject { AccountController.new }
  before { AccountController.send(:include, Bento::Controllers::Helpers) }

  context "with default config" do
    describe "#current_account" do
      let(:account) { Account.make }
      let(:user) { User.make(:account => account) }
      before { subject.stubs(:current_user).returns(user) }

      it "returns the current users account" do
        subject.current_account.should == account
      end
    end
  end

  context "with overridden helper config" do
    before do
      Bento.models = "Site"
      AccountController.send(:include, Bento::Controllers::Helpers)
    end

    context "with one helper name" do
      it "defines the named helper" do
        subject.should respond_to(:current_site)
      end
    end

    context "with several helper name" do
      class Party; end
      before do
        Bento.models = %w[Site Party]
        AccountController.send(:include, Bento::Controllers::Helpers)
      end

      it "defines the named helpers" do
        subject.should respond_to(:current_site)
        subject.should respond_to(:current_party)
      end
    end
  end
end
