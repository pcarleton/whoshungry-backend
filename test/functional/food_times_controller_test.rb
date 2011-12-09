require 'test_helper'

class FoodTimesControllerTest < ActionController::TestCase
  setup do
    @food_time = food_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_time" do
    assert_difference('FoodTime.count') do
      post :create, :food_time => @food_time.attributes
    end

    assert_redirected_to food_time_path(assigns(:food_time))
  end

  test "should show food_time" do
    get :show, :id => @food_time.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @food_time.to_param
    assert_response :success
  end

  test "should update food_time" do
    put :update, :id => @food_time.to_param, :food_time => @food_time.attributes
    assert_redirected_to food_time_path(assigns(:food_time))
  end

  test "should destroy food_time" do
    assert_difference('FoodTime.count', -1) do
      delete :destroy, :id => @food_time.to_param
    end

    assert_redirected_to food_times_path
  end
end
