class Document < ApplicationRecord
  belongs_to :collection
  has_many :fields, dependent: :destroy
  has_many :field_groups, dependent: :destroy
  has_many :patients
  has_one_attached :file

  def id_column
    self.fields.find_sole_by(ctype: "id").name
  end

  def unaligned_fields
    self.fields.where(field_group_id: nil)
  end
end
