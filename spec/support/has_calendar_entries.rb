shared_examples_for "an object that can have calendar_entries" do
  it "has documents" do
    VCR.use_cassette(cassette('calendar_entries')) do
      expect(cals_obj.calendar_entries.size).to be >= 1
      expect(cals_obj.calendar_entries.first).to be_an_instance_of PipelineDeals::CalendarEntry
    end
  end
end
