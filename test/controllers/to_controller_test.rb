require "test_helper"

class ToControllerTest < ActionDispatch::IntegrationTest
  test "should get p" do
    get to_p_url
    assert_response :success
  end

  test "should get main" do
    get to_main_url
    assert_response :success
  end
end
