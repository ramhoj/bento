require 'spec_helper'

describe RailsApp do
  context "Say hello" do
    it "should say hello" do
      visit "/"
      page.body.should include("Hello World")
    end
  end
end