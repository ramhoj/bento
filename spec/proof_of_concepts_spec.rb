require 'spec_helper'

describe RailsApp do
  it "reach it's own files" do
    visit "/"
    page.body.should include("Hello World")
  end

  it "loads app/models" do
    puts Monkey.inspect
    Monkey.should == Monkey
  end

  it "mounts route" do
    visit "/account/new"
    page.status_code.should == 200
  end
end