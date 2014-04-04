class User
  include Mongoid::Document

  before_save :encrypt_password

  has_many :posts, inverse_of: :author
  has_many :responses, inverse_of: :author
  has_and_belongs_to_many :upvotes, class_name: "Post", inverse_of: :upvotes
  has_and_belongs_to_many :downvotes, class_name: "Post", inverse_of: :downvotes

  field :name, type: String, default: ""
  field :email, type: String, default: ""
  field :password, type: String, default: ""
  field :password_salt, type: String, default: ""
  field :password_hash, type: String, default: ""
  field :role, type: String, default: "user"
  field :created_at, type: DateTime, default: -> { Time.now }
  field :last_seen, type: DateTime, default: -> { Time.now }

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A\w+@\w+.[a-z]{2,}\Z/ }, uniqueness: true
  validates :password, presence: true
  validates :created_at, presence: true
  validates :last_seen, presence: true

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    self.password = ""
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first()
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    else
      return nil
    end
  end

end