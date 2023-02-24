require "test_helper"

class PatientTest < ActiveSupport::TestCase
  test "should not allow duplicate patient ids" do
    p1 = Patient.new(collection: collections(:one), patient_id: "1")
    assert p1.save
    p2 = Patient.new(collection: collections(:one), patient_id: "1")
    assert_not p2.save
  end
end
