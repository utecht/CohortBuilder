require "test_helper"

class ConceptMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concept_match = concept_matches(:one)
  end

  test "should get index" do
    get concept_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_concept_match_url
    assert_response :success
  end

  test "should create concept_match" do
    assert_difference("ConceptMatch.count") do
      post concept_matches_url, params: { concept_match: { comment: @concept_match.comment, concept_id: @concept_match.concept_id, option_id: @concept_match.option_id } }
    end

    assert_redirected_to concept_match_url(ConceptMatch.last)
  end

  test "should show concept_match" do
    get concept_match_url(@concept_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_concept_match_url(@concept_match)
    assert_response :success
  end

  test "should update concept_match" do
    patch concept_match_url(@concept_match), params: { concept_match: { comment: @concept_match.comment, concept_id: @concept_match.concept_id, option_id: @concept_match.option_id } }
    assert_redirected_to concept_match_url(@concept_match)
  end

  test "should destroy concept_match" do
    assert_difference("ConceptMatch.count", -1) do
      delete concept_match_url(@concept_match)
    end

    assert_redirected_to concept_matches_url
  end
end
