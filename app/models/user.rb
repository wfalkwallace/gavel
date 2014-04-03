class User
  include Mongoid::Document

  has_many :posts, inverse_of: :author
  has_many :responses, inverse_of: :author
  has_and_belongs_to_many :votes, class_name: "Response", inverse_of: :votes

  field :name, type: String
  field :email, type: String
  field :role, type: String, default: "user"
  field :encrypted_password, type: String
  field :created_at, type: DateTime, default: -> { Time.now }
  field :last_seen, type: DateTime, default: -> { Time.now }

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A\w+@\w+.[a-z]{2,}\Z/ }, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 4 }
  validates :created_at, presence: true
  validates :last_seen, presence: true
end