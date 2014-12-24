require 'test_helper'

class AdicionControllerTest < ActionController::TestCase
  test "should get ingreso" do
    get :ingreso
    assert_response :success
  end

end
