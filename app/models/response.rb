class Response
  include Mongoid::Document

  belongs_to :author, class_name: "User"
  belongs_to :post

  field :body, type: String
  field :created_at, type: DateTime, default: -> { Time.now }
  field :updated_at, type: DateTime, default: -> { Time.now }

  validates :author, presence: true
  validates :post, presence: true
  validates :body, presence: true, length: { maximum: 50 }
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
