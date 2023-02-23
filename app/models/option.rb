class Option < ApplicationRecord
  belongs_to :field
  has_many :records, dependent: :nullify
  has_many :concept_matches, dependent: :destroy
end
