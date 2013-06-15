require 'spec_helper'
PipelineDeals.api_key = ENV['PIPELINEDEALS_API_KEY']
describe PipelineDeals::Company do
  #it_should_behave_like "a paginated collection"

  let(:company) { VCR.use_cassette(:get_a_company) { PipelineDeals::Company.find 3 } }

  it "should have many deals" do
    VCR.use_cassette(:company_deals) do
      company.deals.size.should == 1
      company.deals.first.name.should == "disintermediate value-added technologies"
    end
  end

  it "should have many people" do
    VCR.use_cassette(:company_people) do
      company.people.size.should == 1
      company.people.first.full_name.should == "Rigoberto Murphy"
    end
  end

  # describe "custom fields" do
  #   it "should have custom fields" do
  #     deal.custom_fields.should be_an_instance_of PipelineDeals::Deal::CustomFields
  #     deal.custom_fields.custom_label_25.should == 2
  #   end

  #   it "should be able to update custom fields" do
  #     VCR.use_cassette(:update_deal) do
  #       deal.custom_fields.custom_label_25 = 1
  #       deal.save
  #       PipelineDeals::Deal.find(1).custom_fields.custom_label_25.should == 1
  #     end
  #   end
  # end

  # describe "source" do
  #   it "should have a source" do
  #     deal.source.should be_an_instance_of PipelineDeals::LeadSource
  #     deal.source.name.should == "Cold Call"
  #   end

  #   it "should be able to update the source" do
  #     VCR.use_cassette(:update_lead_source) do
  #       source = PipelineDeals::LeadSource.last
  #       deal.source_id = source.id
  #       deal.save
  #       deal.reload.source.name.should == "Website"
  #     end
  #   end
  # end

  # describe "user" do
  #   it "should have a user" do
  #     deal.user.should be_an_instance_of(PipelineDeals::User)
  #   end
  # end

  # describe "primary_contact" do
  #   let(:deal_with_contact) { VCR.use_cassette(:deal_with_primary_contact) { PipelineDeals::Deal.find 2 } }
  #   it "should have a primary contact" do
  #     deal_with_contact.primary_contact.should be_an_instance_of PipelineDeals::Person
  #   end
  # end

  # describe "company" do
  #   let(:deal_with_company) { VCR.use_cassette(:deal_with_company) { PipelineDeals::Deal.find 81 } }
  #   it "should have a company" do
  #     deal_with_company.company.should be_an_instance_of PipelineDeals::Company
  #   end
  # end

  # describe "deal_stage" do
  #   it "should have a deal stage" do
  #     deal.deal_stage.should be_an_instance_of PipelineDeals::DealStage
  #   end
  # end
end

