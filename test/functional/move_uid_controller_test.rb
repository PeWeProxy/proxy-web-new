require 'test_helper'

class MoveUidControllerTest < ActionController::TestCase
  test "should get move_uid" do
    get :move_uid
    assert_response :success
  end

end
