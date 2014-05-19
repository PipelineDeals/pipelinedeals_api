shared_examples_for "an object that can have documents" do
  it "should have documents" do
    VCR.use_cassette(cassette('documents')) do
      docs_obj.documents.size.should >= 1
      docs_obj.documents.first.should be_an_instance_of PipelineDeals::Document
    end
  end
end

