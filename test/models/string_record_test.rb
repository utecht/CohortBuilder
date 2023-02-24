require "test_helper"

class StringRecordTest < ActiveSupport::TestCase
  test "able to be created" do
    assert StringRecord.new(patient: patients(:one), string_value: "test", field: fields(:one)).save
  end
end
