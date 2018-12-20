require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get pages_sign_in_url
    assert_response :success
  end

end
