shared_examples_for "an object that can have people" do
  it "should have people" do
    VCR.use_cassette(cassette('people')) do
      people_obj.people.size.should == 1
      people_obj.people.first.should be_an_instance_of PipelineDeals::Person
    end
  end
end


