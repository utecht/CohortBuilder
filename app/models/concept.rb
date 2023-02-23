class Concept < ApplicationRecord
	has_many :concept_matches, dependent: :destroy
end
