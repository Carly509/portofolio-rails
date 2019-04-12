class Users < ActiveRecord::Base

  has_one :account

  validates :name, format: { without: /[0-9]/, message: "only letters" }
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :password

  has_many :posts
  has_many :comments, through: :posts
  has_many :friends
  has_many :users, through: :friends
  
end