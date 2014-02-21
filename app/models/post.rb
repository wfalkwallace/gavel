class Post
  include Mongoid::Document
  field :complaint, type: String
  field :defense, type: String
  field :created_at, type: Time
  field :updated_at, type: Time
end
