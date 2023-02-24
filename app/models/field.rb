class Field < ApplicationRecord
  belongs_to :document
  belongs_to :field_group, optional: true
  has_many :options, dependent: :destroy
  has_many :records, dependent: :destroy

  def create_record(patient, value)
    case self.ctype
    when "string"
      StringRecord.new(patient: patient, string_value: value, field: self).save
    when "int"
      IntRecord.new(patient: patient, int_value: value.to_i, field: self).save
    when "float"
      FloatRecord.new(patient: patient, float_value: value.to_f, field: self).save
    when "date"
      DateRecord.new(patient: patient, date_value: value.to_date, field: self).save
    when "option"
      option = Option.find_or_create_by(field: self, value: value)
      OptionRecord.new(patient: patient, option: option, field: self).save
    else
      StringRecord.new(patient: patient, string_value: value, field: self).save
    end
  end
end
