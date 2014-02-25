class Post
  include Mongoid::Document

  has_many :comments
  has_many :responses
  has_and_belongs_to_many :authors, class_name: "Users"

  field :complaint, type: String
  field :defense, type: String
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
