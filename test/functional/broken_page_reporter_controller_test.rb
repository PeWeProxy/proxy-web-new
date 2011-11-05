require 'test_helper'

class BrokenPageReporterControllerTest < ActionController::TestCase
  test "should get reporter" do
    get :reporter
    assert_response :success
  end

end
