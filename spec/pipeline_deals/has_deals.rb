shared_examples_for "an object that can have deals" do
  it "should have deals" do
    VCR.use_cassette(cassette('deals')) do
      deals_obj.deals.size.should >= 1
      deals_obj.deals.first.should be_an_instance_of PipelineDeals::Deal
    end
  end
end


