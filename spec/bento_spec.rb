require 'spec_helper'

describe Bento do
  describe ".models, .models=" do
    before { Bento.models = %w[Account Site] }
    its(:models) { should == %w[Account Site] }
  end

  describe "configure" do
    it "yields it self" do
      Bento.configure { |config| config.should == Bento }
    end
  end
end
