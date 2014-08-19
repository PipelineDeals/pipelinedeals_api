require 'spec_helper'

describe PipelineDeals, "admin data" do
  describe "deal stages" do
    it "should list the deal stages" do
      VCR.use_cassette(:list_deal_stages) do
        stages = PipelineDeals::DealStage.find(:all)
        expect(stages.size).to eq(6)
        expect(stages.first.name).to eq 'Lost'
      end
    end
  end
end
