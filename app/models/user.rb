class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  
  validates :username,
                       :uniqueness => true
  validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX,
                    :confirmation => true
  validates :password, presence: true , length: {minimum:5}, allow_nil: true  
  



  

  has_many :posts
  has_many :comments, through: :posts
  has_many :friends
  has_many :users, through: :friends
end
