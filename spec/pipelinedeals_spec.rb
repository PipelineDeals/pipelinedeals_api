require 'spec_helper'
describe PipelineDeals do

  describe "setting the api key" do
    it "should allow setting the api key" do
      PipelineDeals.should respond_to(:api_key)
    end

    it "should hold the api key" do
      PipelineDeals.api_key = "n8PJJWRsx0MxgOEwGk7"
      PipelineDeals.api_key.should eql("n8PJJWRsx0MxgOEwGk7")
    end
  end

  describe "deals" do
    describe "list deals" do
      it "should list deals correctly" do
        VCR.use_cassette(:list_deals) do
          deals = PipelineDeals::Deal.find(:all)
          deals.count.should eql(142)
          deals.first.class.should eql(PipelineDeals::Deal)
        end
      end
      describe "pagination" do
        it "should paginate" do
          VCR.use_cassette(:paginate_deals) do
            deals = PipelineDeals::Deal.where(per_page: 5, page: 2)
            deals.count.should eql(5)
            deals.pagination.should_not be_nil
            deals.pagination['page'].should eql(2)
            deals.pagination['pages'].should eql(29)
          end
        end
      end

      describe "filtering deals" do
        
      end
    end

    describe "get a single deal" do
    end

    describe "update a deal" do

    end

    describe "delete a deal" do

    end
  end
end

