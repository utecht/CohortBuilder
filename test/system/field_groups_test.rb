require "application_system_test_case"

class FieldGroupsTest < ApplicationSystemTestCase
  setup do
    @field_group = field_groups(:one)
  end

  test "visiting the index" do
    visit field_groups_url
    assert_selector "h1", text: "Field groups"
  end

  test "should create field group" do
    visit field_groups_url
    click_on "New field group"

    fill_in "Description", with: @field_group.description
    fill_in "Document", with: @field_group.document_id
    fill_in "Name", with: @field_group.name
    click_on "Create Field group"

    assert_text "Field group was successfully created"
    click_on "Back"
  end

  test "should update Field group" do
    visit field_group_url(@field_group)
    click_on "Edit this field group", match: :first

    fill_in "Description", with: @field_group.description
    fill_in "Document", with: @field_group.document_id
    fill_in "Name", with: @field_group.name
    click_on "Update Field group"

    assert_text "Field group was successfully updated"
    click_on "Back"
  end

  test "should destroy Field group" do
    visit field_group_url(@field_group)
    click_on "Destroy this field group", match: :first

    assert_text "Field group was successfully destroyed"
  end
end
