require 'spec_helper'

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
  let(:person_with_company) { VCR.use_cassette(:person_with_company) { PipelineDeals::Person.find 1 } }

  it "can filter on lead_status" do
    VCR.use_cassette(:people_filtered_by_status) do
      people = PipelineDeals::Person.where(conditions: {person_status: [2]})
      expect(people.size).to eq 4
      people.all? {|person| [2].include?(person.lead_status.id) }
    end
  end

  describe "associations" do
    it "has a lead_status" do
      expect(person.lead_status).to be_an_instance_of PipelineDeals::LeadStatus
      expect(person.lead_status.name).to eq "Hot"
    end

    it "has a lead_source" do
      expect(person.lead_source).to be_an_instance_of PipelineDeals::LeadSource
      expect(person.lead_source.name).to eq "Cold Call"
    end

    it "has a user" do
      expect(person.user).to be_an_instance_of(PipelineDeals::User)
    end

    it "has a company" do
      expect(person_with_company.company).to be_an_instance_of PipelineDeals::Company
    end
  end
end
