class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Attributes
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :active, type: Boolean, default: false

  # Relationships
  embeds_many :notes
end
