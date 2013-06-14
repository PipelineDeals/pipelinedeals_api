require 'spec_helper'
describe PipelineDeals, "admin data" do
  before(:each) { PipelineDeals.api_key = ENV['PIPELINEDEALS_API_KEY'] }
  describe "deal stages" do
    it "should list the deal stages" do
      VCR.use_cassette(:list_deal_stages) do
        stages = PipelineDeals::DealStage.find(:all)
        stages.size.should == 6
        stages.first.name.should == 'Lost'
      end
    end
  end
end

