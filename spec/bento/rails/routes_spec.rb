require 'spec_helper'

describe ActionDispatch::Routing::Mapper do
  subject { ActionDispatch::Routing::RouteSet.new }

  describe "#bento_for" do
    context "when given one resource name" do
      before { Bento::Controllers::Helpers.should_receive(:define_helpers).with(:account) }

      it "defines the current_<resource_name>-helper when given a string" do
        subject.draw { bento_for("account") }
      end

      it "defines the current_<resource_name>-helper a symbol" do
        subject.draw { bento_for(:account) }
      end
    end

    context "when given several resource names" do
      it "defines the current_<resource_name>-helper symbols" do
        Bento::Controllers::Helpers.should_receive(:define_helpers).with(:account)
        Bento::Controllers::Helpers.should_receive(:define_helpers).with(:site)
        subject.draw { bento_for(:account, :site) }
      end
    end
  end
end
