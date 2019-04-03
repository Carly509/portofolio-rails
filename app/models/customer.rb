class Customer < ApplicationRecord
    has_many :contrats
    has_many :contractuals, through: :contrats
end
