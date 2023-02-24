require "test_helper"

class FieldGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @field_group = field_groups(:one)
    @document = documents(:one)
  end

  test "should get index" do
    get field_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_document_field_group_url(@document)
    assert_response :success
  end

  test "should create field_group" do
    assert_difference("FieldGroup.count") do
      post field_groups_url, params: { field_group: { description: @field_group.description, document_id: @field_group.document_id, name: @field_group.name } }
    end

    assert_redirected_to field_group_url(FieldGroup.last)
  end

  test "should show field_group" do
    get field_groups_url(@field_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_field_group_url(@document, @field_group)
    assert_response :success
  end

  test "should update field_group" do
    patch field_group_url(@field_group), params: { field_group: { description: @field_group.description, document_id: @field_group.document_id, name: @field_group.name } }
    assert_redirected_to field_group_url(@field_group)
  end

  test "should destroy field_group" do
    assert_difference("FieldGroup.count", -1) do
      delete field_group_url(@field_group)
    end

    assert_redirected_to field_groups_url
  end
end
