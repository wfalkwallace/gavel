class Comment
  include Mongoid::Document
  field :votes, type: Integer
  field :created_at, type: Time
  field :updated_at, type: Time
  field :body, type: String
end
