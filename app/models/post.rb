class Post < ApplicationRecord
    validates :description, presence: true , length: {minimum:10, maximum:50}
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    validates :user_id, presence: true
    #display the latest post first. 
    default_scope -> { order(updated_at: :desc)}

end
