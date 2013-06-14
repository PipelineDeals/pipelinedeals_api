module PipelineDeals
  class Deal < PipelineDeals::Resource
    has_many :people, :class_name => PipelineDeals::Person
    has_one :primary_contact, :class_name => PipelineDeals::Person
    has_one :company, :class_name => PipelineDeals::Company
    belongs_to :user, :class_name => PipelineDeals::User
    belongs_to :deal_stage, :class_name => PipelineDeals::DealStage
    belongs_to :source, :class_name => PipelineDeals::LeadSource, :foreign_key => :source_id
  end
end
