class Response
  include Mongoid::Document

  belongs_to :author, class_name: "User"
  has_and_belongs_to_many :voters, class_name: "User", inverse_of: :votes
  belongs_to :post
  has_many :comments, as: :commentable

  field :vote_count, type: Integer
  field :body, type: String
  field :verdict, type: Integer
  field :created_at, type: DateTime
  field :updated_at, type: DateTime

  validates :author, presence: true
  validates :post, presence: true
  validates :body, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
