require 'test_helper'

class RemoveUidControllerTest < ActionController::TestCase
  test "should get remove_uid" do
    get :remove_uid
    assert_response :success
  end

end
