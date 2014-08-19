shared_examples_for "an object that can have deals" do
  it "has deals" do
    VCR.use_cassette(cassette('deals')) do
      expect(deals_obj.deals.size).to be >= 1
      expect(deals_obj.deals.first).to be_an_instance_of PipelineDeals::Deal
    end
  end
end
