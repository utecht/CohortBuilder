require "test_helper"

class FieldTest < ActiveSupport::TestCase
  test "expect to create string record" do
    patient = patients(:one)
    field = fields(:one)
    field.create_record(patient, "a string")
    assert_equal Record.last.class, StringRecord
    assert_equal Record.last.value, "a string"
  end

  test "expect to create date record" do
    patient = patients(:one)
    field = fields(:one)
    field.ctype = 'date'
    field.create_record(patient, "2020-11-28 00:00:00")
    assert_equal Record.last.class, DateRecord
    assert_equal Record.last.value, "November, 28th 2020".to_date
  end

  test "expect to create float record" do
    patient = patients(:one)
    field = fields(:one)
    field.ctype = 'float'
    field.create_record(patient, "259.28")
    assert_equal Record.last.class, FloatRecord
    assert_equal Record.last.value, 259.28
  end

  test "expect to create int record" do
    patient = patients(:one)
    field = fields(:one)
    field.ctype = 'int'
    field.create_record(patient, "259")
    assert_equal Record.last.class, IntRecord
    assert_equal Record.last.value, 259
  end
end
