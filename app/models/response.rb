class Response
  include Mongoid::Document

  belongs_to :author, class_name: "User"
  has_and_belongs_to_many :voters, class_name: "User", inverse_of: :votes
  belongs_to :post
  has_many :comments, as: :commentable

  # TODO: check this defualt syntax
  field :vote_count, type: Integer, default: -> { 0 }
  field :verdict, type: String
  field :created_at, type: DateTime, default: -> { Time.now }
  field :updated_at, type: DateTime, default: -> { Time.now }

  validates :author, presence: true
  validates :post, presence: true
  validates :verdict, presence: true, length: { maximum: 50 }
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
