require "spec_helper"

class PeopleController < ActionController::Base
  def show
    @account = Account.find(params[:account_id])
    render(:text => "s")
  end
end

describe PeopleController do
  let(:account) { Account.make }

  describe "#bento_for" do
    it "defines the nested resource routes" do
      with_routing do |map|
        map.draw do
          bento_for(:accounts) do
            resources :people, :only => [:show]
          end
        end

        get(:show, :account_id => account.id, :id => 1)
        response.should be_success
        assigns[:account].should == account
      end
    end
  end
end