class Field < ApplicationRecord
  belongs_to :document
  has_many :options, dependent: :destroy
  has_many :records, dependent: :destroy
end
