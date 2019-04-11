class Hiring < ApplicationRecord

    before_save {self.email= email.downcase}
  validates :name , presence: true, length: {minimum:5, maximum:30}
  VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email ,presence: true , length: {maximum:255},
                    format: {with: VALIDATE_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false}

    has_many :contracts
    has_secure_password 
    validates :password, presence: true , length: {minimum:5}, allow_nil: true
    has_many :comments, dependent: :destroy
    has_many :post_favorites

end
