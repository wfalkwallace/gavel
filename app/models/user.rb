class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  has_many :posts, inverse_of: :author
  has_many :responses, inverse_of: :author
  has_and_belongs_to_many :upvotes, class_name: "Post", inverse_of: :upvotes
  has_and_belongs_to_many :downvotes, class_name: "Post", inverse_of: :downvotes

  field :name, type: String
  field :role, type: String, default: "user"
  field :created_at, type: DateTime, default: -> { Time.now }
  field :last_seen, type: DateTime, default: -> { Time.now }

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A\w+@\w+.[a-z]{2,}\Z/ }, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 4 }
  validates :created_at, presence: true
  validates :last_seen, presence: true
end