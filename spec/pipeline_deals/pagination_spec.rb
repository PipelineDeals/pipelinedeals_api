
shared_examples_for "a paginated collection" do
  let(:paginated_items) { VCR.use_cassette(cassette('items')) { described_class.find(:all) } }

  it "should have a pagination object" do
    paginated_items.pagination.should_not be_nil
  end

  describe "the pagination object" do
    let(:pagination) { paginated_items.pagination }

    it "should have a total" do
      pagination[:total].should_not be_nil
    end

    it "should have a page number" do
      pagination[:page].should_not be_nil
    end
  end

  describe "specify per_page" do
    let(:per_page) { VCR.use_cassette(cassette('per_page')) { described_class.where(per_page: 7) } }

    it "should be able to specify a per_page" do
      per_page.size.should == 7
    end
  end

  describe "getting a different page" do
    let(:six_things) { VCR.use_cassette(cassette('six_things')) { described_class.where(page: 1, per_page: 6) } }
    let(:next_page) { VCR.use_cassette(cassette('next_page')) { described_class.where(page: 2, per_page: 3) } }
    it "should get the next page of stuff" do
      six_things[3..5].map(&:id).should == next_page.map(&:id)
    end
  end
end
