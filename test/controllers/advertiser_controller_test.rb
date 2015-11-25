require 'test_helper'

class AdvertiserControllerTest < ActionController::TestCase
  test "should get my_promotions" do
    get :my_promotions
    assert_response :success
  end

  test "should get my_reservations" do
    get :my_reservations
    assert_response :success
  end

end
