class Post
  include Mongoid::Document

  has_many :comments, as: :commentable
  has_many :responses
  belongs_to :complainant, class_name: "User", inverse_of: :complaint
  belongs_to :defendant, class_name: "User", inverse_of: :defense

  field :complaint, type: String
  field :defense, type: String
  field :created_at, type: DateTime
  field :updated_at, type: DateTime

  validates :complainant, presence: true
  validates :complaint, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
