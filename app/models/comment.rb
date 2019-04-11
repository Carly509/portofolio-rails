class Comment < ApplicationRecord

    validates :description, presence: true , length: {minimum:10, maximum:100}
    belongs_to :author
    belongs_to :post
    validates :author_id, presence: true
    validates :post_id, presence: true
    #display the latest comment first. 
    default_scope -> { order(updated_at: :desc)}

end
