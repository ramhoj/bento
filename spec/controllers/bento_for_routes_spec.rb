require 'spec_helper'

class SitesController < ActionController::Base
  def show;    render(:text => "s"); end
  def index;   render(:text => "i"); end
  def new;     render(:text => "n"); end
  def edit;    render(:text => "e"); end
  def create;  redirect_to sites_url; end
  def update;  redirect_to sites_url; end
  def destroy; redirect_to sites_url; end
end

context "with the default bento controller" do
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
end

context "with a custonly defined controller" do
  describe SitesController do
    describe "#bento_for" do
      it "defines resource routes" do
        with_routing do |map|
          map.draw { bento_for :sites }

          get(:show, :id => 1);    response.should be_success
          get(:index);             response.should be_success
          get(:new, :id => 1);     response.should be_success
          get(:edit, :id => 1);    response.should be_success
          post(:create);           response.should be_redirect
          put(:update, :id => 1);  response.should be_redirect
          put(:destroy, :id => 1); response.should be_redirect
        end
      end
    end
  end
end
