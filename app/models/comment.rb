class Comment
  include Mongoid::Document

  belongs_to :author, class_name: "User"
  has_many :voters, class_name: "User", inverse_of: :vote
  belongs_to :post

  field :vote_count, type: Integer
  field :body, type: String
  field :ruling, type: Integer
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
