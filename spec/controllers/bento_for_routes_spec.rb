require 'spec_helper'

class ApplicationController < ActionController::Base; end
class AccountsController < ApplicationController
  def show
    render :text => "Show"
  end
end

describe AccountsController do
  describe "#bento_for" do
    it "defines resource routes" do
      with_routing do |map|
        map.draw { resources :accounts }

        get :show, :id => 1
        response.should be_success
      end
    end
  end
end