class Field < ApplicationRecord
  belongs_to :document
  belongs_to :field_group, optional: true
  has_many :options, dependent: :destroy
  has_many :records, dependent: :destroy

  def create_record(patient, value)
    return false if value.nil?
    value = value.chomp
    case self.ctype
    when "string"
      StringRecord.new(patient: patient, string_value: value, field: self).save
    when "int"
      IntRecord.new(patient: patient, int_value: value.to_i, string_value: value, field: self).save
    when "float"
      FloatRecord.new(patient: patient, float_value: value.to_f, string_value: value, field: self).save
    when "date"
      DateRecord.new(patient: patient, date_value: value.to_date, string_value: value, field: self).save
    when "boolean"
      checked = ["checked", "yes"].include? value.downcase
      BooleanRecord.new(patient: patient, boolean_value: checked, string_value: value, field: self).save
    when "option"
      option = Option.find_or_create_by(field: self, value: value)
      OptionRecord.new(patient: patient, option: option, string_value: value, field: self).save
    else
      self.processed = false
      return false
    end
    return true
  end
end
