module PipelineDeals
  class Company < PipelineDeals::Resource
    has_many :deals, class_name: PipelineDeals::Deal
    has_many :people, class_name: PipelineDeals::Person
    has_many :documents, class_name: PipelineDeals::Document
  end
end

