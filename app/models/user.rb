class User < ApplicationRecord

	has_many :order_requests

	enum role: [:customer, :admin]
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :password, presence: true, on: :create

  def name
    [first_name, last_name].compact.join(' ')
  end
  def self.user
    "user"
  end

end
