module PipelineDeals
  class Note < PipelineDeals::Resource
    belongs_to :note_category, class_name: PipelineDeals::NoteCategory
    belongs_to :company, class_name: PipelineDeals::Company
    belongs_to :deal, class_name: PipelineDeals::Deal
    belongs_to :person, class_name: PipelineDeals::Person
    belongs_to :created_by_user, class_name: PipelineDeals::User, foreign_key: :created_by_user_id
  end
end
