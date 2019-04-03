class Contractual < ApplicationRecord
    has_many :contrats
    has_many :customers, through: :contrats

    def contrat_count
    self.contrats.size
  end
end
