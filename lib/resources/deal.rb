module PipelineDeals
  class Deal < PipelineDeals::Resource
    has_many :people, :class_name => PipelineDeals::Person
    has_one :primary_contact, :class_name => PipelineDeals::Person
    has_one :company, :class_name => PipelineDeals::Company
    belongs_to :user, :class_name => PipelineDeals::User

  # {"summary"=>nil,
  #  "primary_contact_id"=>24,
  #  "expected_close_date"=>nil,
  #  "deal_stage_id"=>nil,   "name"=>"blah2",
  #  "primary_contact"=>
  #   #<PipelineDeals::Deal::PrimaryContact:0x007f92c396b100
  #    @attributes={"id"=>24, "last_name"=>"buttface", "first_name"=>"Jo"},
  #    @persisted=true,
  #    @prefix_options={}>,
  #  "user_id"=>1,
  #  "company_id"=>nil,
  #  "source_id"=>nil,
  #  "is_example"=>nil,
  #  "created_at"=>"2013/04/16 10:09:41 -0400",
  #  "company"=>nil,
  #  "person_ids"=>[24, 25],
  #  "collaborators"=>[],
  #  "people"=>
  #   [#<PipelineDeals::Person:0x007f92c3969a30
  #     @attributes={"id"=>24, "last_name"=>"buttface", "first_name"=>"Jo"},
  #     @persisted=true,
  #     @prefix_options={}>,     #<PipelineDeals::Person:0x007f92c39684a0
  #     @attributes={"id"=>25, "last_name"=>"O'Kon", "first_name"=>"Sherman"},      @persisted=true,      @prefix_options={}>],
  #  "status"=>2,
  #  "custom_fields"=>
  #   #<PipelineDeals::Deal::CustomFields:0x007f92c396d928
  #    @attributes=
  #     {"custom_label_29"=>54321,
  #      "custom_label_27"=>nil,
  #      "custom_label_26"=>nil,
  #      "custom_label_25"=>nil},
  #    @persisted=true,
  #    @prefix_options={}>,
  #  "probability"=>99,
  #  "is_archived"=>false,
  #  "closed_time"=>nil,
  #  "deal_stage"=>nil,
  #  "id"=>1,
  #  "user"=>
  #   #<PipelineDeals::Deal::User:0x007f92c3976f00
  #    @attributes={"id"=>1, "last_name"=>"hoboson", "first_name"=>"hobo"},
  #    @persisted=true,
  #    @prefix_options={}>,
  #  "value_in_cents"=>5588600,
  #  "import_id"=>nil,
  #  "updated_at"=>"2013/04/19 18:18:36 -0400",
  #  "expected_close_date_event_id"=>nil},
  end
end
