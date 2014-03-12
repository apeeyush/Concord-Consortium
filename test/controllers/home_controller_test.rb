require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get data" do
    get :data
    assert_response :success
  end

  test "should get analysis" do
    get :analysis
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
