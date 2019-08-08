require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get action" do
    get search_action_url
    assert_response :success
  end

end
