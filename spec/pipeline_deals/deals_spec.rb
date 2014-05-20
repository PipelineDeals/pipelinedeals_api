require 'spec_helper'

describe PipelineDeals::Deal do
  it_should_behave_like "a paginated collection"

  let(:docs_obj) { deal }
  let(:cals_obj) { deal }
  let(:notes_obj) { deal }
  let(:people_obj) { VCR.use_cassette(:deal_with_primary_contact) { PipelineDeals::Deal.find 2 } }
  it_should_behave_like "an object that can have documents"
  it_should_behave_like "an object that can have people"
  it_should_behave_like "an object that can have notes"
  it_should_behave_like "an object that can have calendar_entries"

  let(:deal) { VCR.use_cassette(:get_a_deal) { PipelineDeals::Deal.find 1 } }

  describe "filtering" do
    it "should be able to filter on stage" do
      VCR.use_cassette(:deals_filtered_by_stage) do
        deals = PipelineDeals::Deal.where(conditions: {deal_stage: [2,4]})
        deals.size.should == 3
        deals.all? {|deal| [2,4].include?(deal.deal_stage_id) }
      end
    end
  end


  describe "associations" do
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
        deal.source.should be_an_instance_of PipelineDeals::LeadSource
        deal.source.name.should == "Cold Call"
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
        deal.user.should be_an_instance_of(PipelineDeals::User)
      end
    end

    describe "primary_contact" do
      let(:deal_with_contact) { VCR.use_cassette(:deal_with_primary_contact) { PipelineDeals::Deal.find 2 } }
      it "should have a primary contact" do
        deal_with_contact.primary_contact.should be_an_instance_of PipelineDeals::Person
      end
    end

    describe "company" do
      let(:deal_with_company) { VCR.use_cassette(:deal_with_company) { PipelineDeals::Deal.find 81 } }
      it "should have a company" do
        deal_with_company.company.should be_an_instance_of PipelineDeals::Company
      end
    end

    describe "deal_stage" do
      it "should have a deal stage" do
        deal.deal_stage.should be_an_instance_of PipelineDeals::DealStage
      end
    end
  end
end
