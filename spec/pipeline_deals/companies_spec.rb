require 'spec_helper'

describe PipelineDeals::Company do
  it_should_behave_like "a paginated collection"

  let(:docs_obj) { company }
  let(:people_obj) { company }
  it_should_behave_like "an object that can have documents"
  it_should_behave_like "an object that can have people"

  let(:company) { VCR.use_cassette(:get_a_company) { PipelineDeals::Company.find 3 } }

  it "has many deals" do
    VCR.use_cassette(:company_deals) do
      expect(company.deals.size).to eq 1
      expect(company.deals.first.name).to eq "disintermediate value-added technologies"
    end
  end
end
