require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get build_prog" do
    get :build_prog
    assert_response :success
  end

end
