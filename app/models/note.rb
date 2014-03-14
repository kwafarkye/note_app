class Note
  include Mongoid::Document
  include Mongoid::Timestamps

  field :note_content, type: String

  # Relationships
  embedded_in :user

end