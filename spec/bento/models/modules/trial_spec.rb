require 'spec_helper'

class TrialTestAccount < ActiveRecord::Base
  set_table_name("accounts")
  attr_accessible :name, :created_at
  bento_account(:trial)
end

describe Bento::Models::Modules::Trial do
  subject { TrialTestAccount.new }
  it { should_not be_invalid_without(:name) }
  it { should_not have_user_accessors }
  it { should_not respond_to(:users) }
  it { should respond_to(:trial_days_remaining) }
  it { should_not respond_to(:build_user) }

  describe "#trial_days_remaining" do
    subject { TrialTestAccount.create!(:name => "Account", :created_at => 6.days.ago).trial_days_remaining }
    it("returns the number of days that are left in the trial") { should == 24 }
  end
  
end
