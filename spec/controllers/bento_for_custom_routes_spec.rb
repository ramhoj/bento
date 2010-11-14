require "spec_helper"

class SitesController < ActionController::Base
  def show;    render(:text => "s"); end
  def index;   render(:text => "i"); end
  def new;     render(:text => "n"); end
  def edit;    render(:text => "e"); end
  def create;  redirect_to sites_url; end
  def update;  redirect_to sites_url; end
  def destroy; redirect_to sites_url; end
end

describe SitesController do
  describe "#bento_for" do
    it "defines resource routes" do
      with_routing do |map|
        map.draw { bento_for :sites }

        get(:show, :id => 1);    response.should be_success
        get(:index);             response.should be_success
        get(:new, :id => 1);     response.should be_success
        get(:edit, :id => 1);    response.should be_success
        put(:update, :id => 1);  response.should be_redirect
        post(:create);           response.should be_redirect
        put(:destroy, :id => 1); response.should be_redirect
      end
    end
  end
end