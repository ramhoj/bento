require 'spec_helper'

describe RailsApp do
  it "reach it's own files" do
    visit "/"
    page.body.should include("Hello World")
  end

  it "loads app" do
    Bento::AccountsController.should == Bento::AccountsController
  end

  it "mounts the new accounts route" do
    visit "/accounts/new"
    page.status_code.should == 200
  end
end