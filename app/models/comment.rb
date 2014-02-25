class Comment
  include Mongoid::Document

  belongs_to :user
  belongs_to :post

  field :votes, type: Integer
  field :body, type: String
  field :ruling, type: Integer
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
end
