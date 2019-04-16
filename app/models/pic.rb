class Pic < ApplicationRecord
    validates :description, presence: true , length: {minimum:10, maximum:50}
        belongs_to :user
        has_many :comments
        has_many :users, through: :comments
        validates :user_id, presence: true
        #display the latest post first. 
        default_scope -> { order(updated_at: :desc)}

        has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
