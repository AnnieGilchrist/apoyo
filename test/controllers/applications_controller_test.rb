require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get after_sign_in_path_for" do
    get applications_after_sign_in_path_for_url
    assert_response :success
  end

end
