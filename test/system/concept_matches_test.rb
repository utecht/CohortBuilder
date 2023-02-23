require "application_system_test_case"

class ConceptMatchesTest < ApplicationSystemTestCase
  setup do
    @concept_match = concept_matches(:one)
  end

  test "visiting the index" do
    visit concept_matches_url
    assert_selector "h1", text: "Concept matches"
  end

  test "should create concept match" do
    visit concept_matches_url
    click_on "New concept match"

    fill_in "Comment", with: @concept_match.comment
    fill_in "Concept", with: @concept_match.concept_id
    fill_in "Option", with: @concept_match.option_id
    click_on "Create Concept match"

    assert_text "Concept match was successfully created"
    click_on "Back"
  end

  test "should update Concept match" do
    visit concept_match_url(@concept_match)
    click_on "Edit this concept match", match: :first

    fill_in "Comment", with: @concept_match.comment
    fill_in "Concept", with: @concept_match.concept_id
    fill_in "Option", with: @concept_match.option_id
    click_on "Update Concept match"

    assert_text "Concept match was successfully updated"
    click_on "Back"
  end

  test "should destroy Concept match" do
    visit concept_match_url(@concept_match)
    click_on "Destroy this concept match", match: :first

    assert_text "Concept match was successfully destroyed"
  end
end
