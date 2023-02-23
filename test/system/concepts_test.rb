require "application_system_test_case"

class ConceptsTest < ApplicationSystemTestCase
  setup do
    @concept = concepts(:one)
  end

  test "visiting the index" do
    visit concepts_url
    assert_selector "h1", text: "Concepts"
  end

  test "should create concept" do
    visit concepts_url
    click_on "New concept"

    fill_in "Definition", with: @concept.definition
    fill_in "Label", with: @concept.label
    fill_in "Obo class", with: @concept.obo_class
    fill_in "Rdf template", with: @concept.rdf_template
    click_on "Create Concept"

    assert_text "Concept was successfully created"
    click_on "Back"
  end

  test "should update Concept" do
    visit concept_url(@concept)
    click_on "Edit this concept", match: :first

    fill_in "Definition", with: @concept.definition
    fill_in "Label", with: @concept.label
    fill_in "Obo class", with: @concept.obo_class
    fill_in "Rdf template", with: @concept.rdf_template
    click_on "Update Concept"

    assert_text "Concept was successfully updated"
    click_on "Back"
  end

  test "should destroy Concept" do
    visit concept_url(@concept)
    click_on "Destroy this concept", match: :first

    assert_text "Concept was successfully destroyed"
  end
end
