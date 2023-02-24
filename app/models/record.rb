class Record < ApplicationRecord
  belongs_to :patient
  belongs_to :field
  belongs_to :option, optional: true
end

