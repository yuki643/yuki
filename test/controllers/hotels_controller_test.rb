require "test_helper"

class HotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get top_page" do
    get hotels_top_page_url
    assert_response :success
  end
end
