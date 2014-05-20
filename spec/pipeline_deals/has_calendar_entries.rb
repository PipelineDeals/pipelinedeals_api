shared_examples_for "an object that can have calendar_entries" do
  it "should have documents" do
    VCR.use_cassette(cassette('calendar_entries')) do
      cals_obj.calendar_entries.size.should >= 1
      cals_obj.calendar_entries.first.should be_an_instance_of PipelineDeals::CalendarEntry
    end
  end
end
