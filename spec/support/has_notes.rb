shared_examples_for "an object that can have notes" do
  it "has notes" do
    VCR.use_cassette(cassette('notes')) do
      expect(notes_obj.notes.size).to be >= 1
      expect(notes_obj.notes.first).to be_an_instance_of PipelineDeals::Note
    end
  end
end
