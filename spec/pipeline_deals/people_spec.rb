require 'spec_helper'
PipelineDeals.api_key = ENV['PIPELINEDEALS_API_KEY']
describe PipelineDeals::Person do
  it_should_behave_like "a paginated collection"

  let(:docs_obj) { person }
  let(:cals_obj) { person }
  let(:notes_obj) { person }
  let(:deals_obj) { VCR.use_cassette(:person_with_deals) { PipelineDeals::Person.find 1 } }
  it_should_behave_like "an object that can have documents"
  it_should_behave_like "an object that can have deals"
  it_should_behave_like "an object that can have notes"
  it_should_behave_like "an object that can have calendar_entries"

  let(:person) { VCR.use_cassette(:get_a_person) { PipelineDeals::Person.find 1 } }

  describe "filtering" do
    it "should be able to filter on lead_status" do
      VCR.use_cassette(:people_filtered_by_status) do
        people = PipelineDeals::Person.where(conditions: {person_status: [2]})
        people.size.should == 4
        people.all? {|person| [2].include?(person.lead_status.id) }
      end
    end
  end


  describe "associations" do
    it "should have a lead_status" do
      person.lead_status.should be_an_instance_of PipelineDeals::LeadStatus
      person.lead_status.name.should == "Hot"
    end

#    describe "custom fields" do
#      it "should have custom fields" do
#        deal.custom_fields.should be_an_instance_of PipelineDeals::Deal::CustomFields
#        deal.custom_fields.custom_label_25.should == 2
#      end
#
#      it "should be able to update custom fields" do
#        VCR.use_cassette(:update_deal) do
#          deal.custom_fields.custom_label_25 = 1
#          deal.save
#          PipelineDeals::Deal.find(1).custom_fields.custom_label_25.should == 1
#        end
#      end
#    end

    describe "lead_source" do
      it "should have a lead_source" do
        person.lead_source.should be_an_instance_of PipelineDeals::LeadSource
        person.lead_source.name.should == "Cold Call"
      end

#      it "should be able to update the source" do
#        VCR.use_cassette(:update_lead_source) do
#          source = PipelineDeals::LeadSource.last
#          person.source_id = source.id
#          person.save
#          person.reload.source.name.should == "Website"
#        end
#      end
    end

    describe "user" do
      it "should have a user" do
        person.user.should be_an_instance_of(PipelineDeals::User)
      end
    end

    describe "company" do
      let(:person_with_company) { VCR.use_cassette(:person_with_company) { PipelineDeals::Person.find 1 } }
      it "should have a company" do
        person_with_company.company.should be_an_instance_of PipelineDeals::Company
      end
    end
  end
end
