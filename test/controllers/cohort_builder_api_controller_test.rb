require "test_helper"

class CohortBuilderApiControllerTest < ActionDispatch::IntegrationTest
  test "should get collections" do
    get api_collections_url
    assert_response :success
  end

  test "should get config" do
    get api_config_url
    assert_response :success
  end

end
