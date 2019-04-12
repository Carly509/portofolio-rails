class Comment < ApplicationRecord

    validates :description, presence: true , length: {minimum:10, maximum:50}
    belongs_to :user
    belongs_to :post
    validates :_id, presence: true
    validates :post_id, presence: true
    #display the latest comment first. 
    default_scope -> { order(updated_at: :desc)}

end
