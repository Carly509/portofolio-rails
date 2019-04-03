class Contrat < ApplicationRecord
    belongs_to :contractual
    belongs_to :customer
end
