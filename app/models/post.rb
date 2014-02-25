class Post
  include Mongoid::Document

  has_many :comments
  has_many :responses
  belongs_to :complainant, class_name: "Users", inverse_of: :complaint
  belongs_to :defendant, class_name: "Users", inverse_of: :defense

  field :complaint, type: String
  field :defense, type: String
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
