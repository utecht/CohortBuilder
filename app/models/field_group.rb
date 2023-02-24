class FieldGroup < ApplicationRecord
  belongs_to :document
  has_many :fields, dependent: :nullify
end
