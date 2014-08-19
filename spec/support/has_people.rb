shared_examples_for "an object that can have people" do
  it "has people" do
    VCR.use_cassette(cassette('people')) do
      expect(people_obj.people.size).to be >= 1
      expect(people_obj.people.first).to be_an_instance_of PipelineDeals::Person
    end
  end
end
