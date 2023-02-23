class Patient < ApplicationRecord
  belongs_to :collection
  has_many :records, dependent: :destroy
end
