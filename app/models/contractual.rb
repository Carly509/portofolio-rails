class Contractual < ApplicationRecord
     has_many :contracts
    has_many :customers, through: :contracts

    # def contract_count
    # self.contracts.size
    # end
end
