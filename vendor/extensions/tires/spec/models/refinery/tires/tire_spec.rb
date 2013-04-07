require 'spec_helper'

module Refinery
  module Tires
    describe Tire do
      describe "validations" do
        subject do
          FactoryGirl.create(:tire,
          :category => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:category) { should == "Refinery CMS" }
      end
    end
  end
end
