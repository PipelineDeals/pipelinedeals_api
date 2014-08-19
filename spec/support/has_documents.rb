shared_examples_for "an object that can have documents" do
  it "has documents" do
    VCR.use_cassette(cassette('documents')) do
      expect(docs_obj.documents.size).to be >= 1
      expect(docs_obj.documents.first).to be_an_instance_of PipelineDeals::Document
    end
  end
end
