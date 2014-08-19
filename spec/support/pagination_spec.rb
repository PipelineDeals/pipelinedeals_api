shared_examples_for "a paginated collection" do
  let(:paginated_items) { VCR.use_cassette(cassette('items')) { described_class.find(:all) } }

  it "should have a pagination object" do
    expect(paginated_items.pagination).to be
  end

  describe "the pagination object" do
    let(:pagination) { paginated_items.pagination }

    it "has a total" do
      expect(pagination[:total]).to be
    end

    it "has a page number" do
      expect(pagination[:page]).to be
    end
  end

  describe "specify per_page" do
    let(:per_page) { VCR.use_cassette(cassette('per_page')) { described_class.where(per_page: 7) } }

    it "can specify a per_page" do
      expect(per_page.size).to eq 7
    end
  end

  describe "getting a different page" do
    let(:six_things) { VCR.use_cassette(cassette('six_things')) { described_class.where(page: 1, per_page: 6) } }
    let(:next_page) { VCR.use_cassette(cassette('next_page')) { described_class.where(page: 2, per_page: 3) } }

    it "gets the next page of stuff" do
      expect(six_things[3..5].map(&:id)).to eq next_page.map(&:id)
    end
  end
end
