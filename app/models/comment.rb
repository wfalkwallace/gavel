class Comment
  include Mongoid::Document

  belongs_to :author, class_name: "User"
  belongs_to :commentable, polymorphic: true

  field :body, type: String
  field :created_at, type: DateTime
  field :updated_at, type: DateTime

  validates :author, presence: true
  validates :commentable, presence: true
  validates :body, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
