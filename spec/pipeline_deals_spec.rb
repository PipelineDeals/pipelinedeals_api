require 'spec_helper'

describe PipelineDeals do
  describe '#configure' do
    it 'honors api_key=' do
      PipelineDeals.configure {|c| c.api_key = 'xyz' }
      expect(PipelineDeals.api_key).to eq 'xyz'
    end
    it 'honors app_key=' do
      PipelineDeals.configure {|c| c.app_key = 'xyz' }
      expect(PipelineDeals.app_key).to eq 'xyz'
    end
    it 'honors site=' do
      PipelineDeals.configure {|c| c.site = 'http://localhost:3000' }
      expect(PipelineDeals::Resource.site.to_s).to eq 'http://localhost:3000'
    end
  end
end
