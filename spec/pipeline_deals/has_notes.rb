shared_examples_for "an object that can have notes" do
  it "should have notes" do
    VCR.use_cassette(cassette('notes')) do
      notes_obj.notes.size.should >= 1
      notes_obj.notes.first.should be_an_instance_of PipelineDeals::Note
    end
  end
end

