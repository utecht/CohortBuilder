class Document < ApplicationRecord
  belongs_to :collection
  has_many :fields, dependent: :destroy
  has_many :patients
  has_one_attached :file
end
