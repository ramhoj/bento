require "spec_helper"

describe Bento::AccountsController do
  before { controller.stubs(:authenticate_user!) }
  let(:account) { Account.make }

  describe "#bento_for" do
    it "defines resource routes" do
      with_routing do |map|
        map.draw { bento_for :accounts }

        get(:show, :id => account.id);    response.should be_success
        get(:index);                      response.should be_success
        get(:sign_up);                    response.should be_success
        get(:new, :id => account.id);     response.should be_success
        get(:edit, :id => account.id);    response.should be_success
        post(:create);                    response.should be_redirect
        put(:update, :id => account.id);  response.should be_redirect
        put(:destroy, :id => account.id); response.should be_redirect
      end
    end
  end
end