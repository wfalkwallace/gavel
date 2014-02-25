class User
  include Mongoid::Document

  has_many :comments, inverse_of: :author
  has_many :responses, inverse_of: :author
  has_many :complaints, class_name: "Post", inverse_of: :complainant
  has_many :defenses, class_name: "Post", inverse_of: :defendant
  has_and_belongs_to_many :votes, class_name: "Response", inverse_of: :voter


  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
  field :created_at, type: DateTime
  field :last_seen, type: DateTime
end
