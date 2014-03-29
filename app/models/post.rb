class Post
  include Mongoid::Document

  belongs_to :complainant, class_name: "User", inverse_of: :complaint
  has_many :responses

  field :complaint, type: String
  field :created_at, type: DateTime, default: -> { Time.now }
  field :updated_at, type: DateTime, default: -> { Time.now }

  validates :complainant, presence: true
  validates :complaint, presence: true, length: { maximum: 140 }
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
