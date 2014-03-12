require 'test_helper'

class LogDataControllerTest < ActionController::TestCase
  setup do
    @log_datum = log_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:log_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log_datum" do
    assert_difference('LogDatum.count') do
      post :create, log_datum: { event: @log_datum.event, session: @log_datum.session, time: @log_datum.time, timeDrift: @log_datum.timeDrift }
    end

    assert_redirected_to log_datum_path(assigns(:log_datum))
  end

  test "should show log_datum" do
    get :show, id: @log_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log_datum
    assert_response :success
  end

  test "should update log_datum" do
    patch :update, id: @log_datum, log_datum: { event: @log_datum.event, session: @log_datum.session, time: @log_datum.time, timeDrift: @log_datum.timeDrift }
    assert_redirected_to log_datum_path(assigns(:log_datum))
  end

  test "should destroy log_datum" do
    assert_difference('LogDatum.count', -1) do
      delete :destroy, id: @log_datum
    end

    assert_redirected_to log_data_path
  end
end
