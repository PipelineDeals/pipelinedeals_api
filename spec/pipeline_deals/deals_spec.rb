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
  let(:deal_with_contact) { VCR.use_cassette(:deal_with_primary_contact) { PipelineDeals::Deal.find 2 } }
  let(:deal_with_company) { VCR.use_cassette(:deal_with_company) { PipelineDeals::Deal.find 81 } }

  it "creates a deal" do
    VCR.use_cassette(:deal_create) do
      new_deal = PipelineDeals::Deal.create(:name => 'a new deal')
      new_deal.attributes.keys.include?(:id)
    end
  end

  describe "filters" do
    it "on stage" do
      VCR.use_cassette(:deals_filtered_by_stage) do
        deals = PipelineDeals::Deal.where(conditions: { deal_stage: [2,4] })
        expect(deals.size).to eq 3
        expect(deals.map(&:deal_stage_id)).to include(2)
        expect(deals.map(&:deal_stage_id)).to include(4)
      end
    end

    it "on numeric custom field" do
      VCR.use_cassette(:deals_filtered_by_custom_field) do
        deals = PipelineDeals::Deal.where(conditions: {custom_label_11: { from: 3, to: 7 }})
        expect(deals.size).to eq(1)
        deals.all? {|deal| deal.custom_fields.custom_label_11 >= 3 && deal.custom_fields.custom_label_11 <+ 7 }
      end
    end

    it "on picklist custom field" do
      VCR.use_cassette(:deals_filtered_by_custom_field) do
        deals = PipelineDeals::Deal.where(conditions: {custom_label_12: [19,20]})
        expect(deals.size).to eq 1
        deals.all? { |deal| ([19,20] & deal.custom_fields.custom_label_12).any? }
      end
    end
  end

  describe "associations" do
    it "has a deal stage" do
      expect(deal.deal_stage).to be_an_instance_of PipelineDeals::DealStage
      expect(deal.deal_stage.name).to eq "Qualified Lead"
    end

    it "has custom fields" do
      expect(deal.custom_fields).to be_an_instance_of PipelineDeals::Deal::CustomFields
      expect(deal.custom_fields.custom_label_25).to eq 2
    end

    it "can update custom fields" do
      VCR.use_cassette(:update_deal) do
        deal.custom_fields.custom_label_25 = 1
        deal.save
        custom_label = PipelineDeals::Deal.find(1).custom_fields.custom_label_25
        expect(custom_label).to eq 1
      end
    end

    it "has a source" do
      expect(deal.source).to be_an_instance_of PipelineDeals::LeadSource
      expect(deal.source.name).to eq "Cold Call"
    end

    it "can update source" do
      VCR.use_cassette(:update_lead_source) do
        source = PipelineDeals::LeadSource.last
        deal.source_id = source.id
        deal.save
        expect(deal.reload.source.name).to eq "Website"
      end
    end

    it "has a user" do
      expect(deal.user).to be_an_instance_of(PipelineDeals::User)
    end

    it "has a primary contact" do
      expect(deal_with_contact.primary_contact).to be_an_instance_of PipelineDeals::Person
    end

    it "has a company" do
      expect(deal_with_company.company).to be_an_instance_of PipelineDeals::Company
    end

    it "has a deal stage" do
      expect(deal.deal_stage).to be_an_instance_of PipelineDeals::DealStage
    end
  end
end
