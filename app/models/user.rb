class User < ActiveRecord::Base

  has_one :account

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :name, format: { without: /[0-9]/, message: "only letters" }
  validates :username, :length => { :within => 8..25 },
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