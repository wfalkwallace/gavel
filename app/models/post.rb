class Post
  include Mongoid::Document

  belongs_to :author, class_name: "User", inverse_of: :post
  has_many :responses
  has_and_belongs_to_many :upvotes, class_name: "User", inverse_of: :upvotes
  has_and_belongs_to_many :downvotes, class_name: "User", inverse_of: :downvotes

  field :title, type: String
  field :body, type: String
  field :upvote_count, type: Integer, default: -> { 0 }
  field :downvote_count, type: Integer, default: -> { 0 }
  field :created_at, type: DateTime, default: -> { Time.now }
  field :updated_at, type: DateTime, default: -> { Time.now }

  validates :author, presence: true
  validates :title, presence: true, length: { maximum: 10 }
  validates :body, presence: true, length: { maximum: 140 }
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
