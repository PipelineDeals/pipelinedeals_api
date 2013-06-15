module PipelineDeals
  class Document < PipelineDeals::Resource
    belongs_to :user, class_name: PipelineDeals::User
    belongs_to :deal, class_name: PipelineDeals::Deal
    belongs_to :person, class_name: PipelineDeals::Person
    belongs_to :company, class_name: PipelineDeals::Company
  end
end

