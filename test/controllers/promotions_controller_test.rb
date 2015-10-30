require 'test_helper'

class PromotionsControllerTest < ActionController::TestCase
  setup do
    @promotion = promotions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promotion" do
    assert_difference('Promotion.count') do
      post :create, promotion: { banner_url: @promotion.banner_url, date_of_creation: @promotion.date_of_creation, description: @promotion.description, duration_flag: @promotion.duration_flag, end_date: @promotion.end_date, quantity: @promotion.quantity, title: @promotion.title }
    end

    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should show promotion" do
    get :show, id: @promotion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promotion
    assert_response :success
  end

  test "should update promotion" do
    patch :update, id: @promotion, promotion: { banner_url: @promotion.banner_url, date_of_creation: @promotion.date_of_creation, description: @promotion.description, duration_flag: @promotion.duration_flag, end_date: @promotion.end_date, quantity: @promotion.quantity, title: @promotion.title }
    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should destroy promotion" do
    assert_difference('Promotion.count', -1) do
      delete :destroy, id: @promotion
    end

    assert_redirected_to promotions_path
  end
end
