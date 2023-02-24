class Patient < ApplicationRecord
  validates :patient_id, uniqueness: { scope: :collection, message: "each collection may only have 1 patient with same id" }
  belongs_to :collection
  has_many :records, dependent: :destroy
end
