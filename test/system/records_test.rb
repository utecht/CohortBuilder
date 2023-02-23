require "application_system_test_case"

class RecordsTest < ApplicationSystemTestCase
  setup do
    @record = records(:one)
  end

  test "visiting the index" do
    visit records_url
    assert_selector "h1", text: "Records"
  end

  test "should create record" do
    visit records_url
    click_on "New record"

    fill_in "Date value", with: @record.date_value
    fill_in "Field", with: @record.field_id
    fill_in "Float value", with: @record.float_value
    fill_in "Int value", with: @record.int_value
    fill_in "Option", with: @record.option_id
    fill_in "Patient", with: @record.patient_id
    fill_in "String value", with: @record.string_value
    fill_in "Type", with: @record.type
    click_on "Create Record"

    assert_text "Record was successfully created"
    click_on "Back"
  end

  test "should update Record" do
    visit record_url(@record)
    click_on "Edit this record", match: :first

    fill_in "Date value", with: @record.date_value
    fill_in "Field", with: @record.field_id
    fill_in "Float value", with: @record.float_value
    fill_in "Int value", with: @record.int_value
    fill_in "Option", with: @record.option_id
    fill_in "Patient", with: @record.patient_id
    fill_in "String value", with: @record.string_value
    fill_in "Type", with: @record.type
    click_on "Update Record"

    assert_text "Record was successfully updated"
    click_on "Back"
  end

  test "should destroy Record" do
    visit record_url(@record)
    click_on "Destroy this record", match: :first

    assert_text "Record was successfully destroyed"
  end
end
