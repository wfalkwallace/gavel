class Response
  include Mongoid::Document

  belongs_to :author, class_name: "User"
  has_and_belongs_to_many :voters, class_name: "User", inverse_of: :votes
  belongs_to :post

  field :vote_count, type: Integer
  field :body, type: String
  field :verdict, type: Integer
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
