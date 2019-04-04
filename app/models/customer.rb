class Customer < ApplicationRecord
    has_many :contracts
    has_many :contractuals, through: :contracts
end
