module PipelineDeals
  class Deal < PipelineDeals::Resource
    has_many :people, class_name: PipelineDeals::Person
    has_many :documents, class_name: PipelineDeals::Document
    has_many :notes, class_name: PipelineDeals::Note
    has_many :calendar_entries, class_name: PipelineDeals::CalendarEntry, as: :association
    belongs_to :primary_contact, class_name: PipelineDeals::Person
    belongs_to :company, class_name: PipelineDeals::Company
    belongs_to :user, class_name: PipelineDeals::User
    belongs_to :deal_stage, class_name: PipelineDeals::DealStage
    belongs_to :source, class_name: PipelineDeals::LeadSource, foreign_key: :source_id
  end
end
