class Response
  include Mongoid::Document

  belongs_to :author, class_name: "User"
  belongs_to :voter, class_name: "User", inverse_of: :vote
  belongs_to :post


  field :vote_count, type: Integer
  field :body, type: String
  field :verdict, type: Integer
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
