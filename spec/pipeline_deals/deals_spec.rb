require 'spec_helper'
PipelineDeals.api_key = ENV['PIPELINEDEALS_API_KEY']
describe PipelineDeals, "deals" do
  let(:deal) do
    VCR.use_cassette(:get_a_deal) { PipelineDeals::Deal.find 1 }
  end

  it "should have a deal stage" do
    deal.deal_stage.should be_an_instance_of PipelineDeals::DealStage
    deal.deal_stage.name.should == "Qualified Lead"
  end

  describe "custom fields" do
    it "should have custom fields" do
      deal.custom_fields.should be_an_instance_of PipelineDeals::Deal::CustomFields
      deal.custom_fields.custom_label_25.should == 2
    end

    it "should be able to update custom fields" do
      VCR.use_cassette(:update_deal) do
        deal.custom_fields.custom_label_25 = 1
        deal.save
        PipelineDeals::Deal.find(1).custom_fields.custom_label_25.should == 1
      end
    end
  end

  describe "source" do
    it "should have a source" do
      VCR.use_cassette(:lead_source) do
        #deal.source.should be_an_instance_of PipelineDeals::LeadSource
        deal.source.name.should == "Cold Call"
      end
    end

    it "should be able to update the source" do
      VCR.use_cassette(:update_lead_source) do
        source = PipelineDeals::LeadSource.last
        deal.source_id = source.id
        deal.save
        deal.reload.source.name.should == "Website"
      end
    end
  end

  describe "user" do
    it "should have a user" do
      VCR.use_cassette(:deal_user) do
        deal.user.should be_an_instance_of(PipelineDeals::User)
      end
    end
  end
end
