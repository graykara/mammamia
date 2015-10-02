require 'test_helper'

class Admin::DeviceCodesControllerTest < ActionController::TestCase
  setup do
    @admin_device_code = admin_device_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_device_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_device_code" do
    assert_difference('Admin::DeviceCode.count') do
      post :create, admin_device_code: {  }
    end

    assert_redirected_to admin_device_code_path(assigns(:admin_device_code))
  end

  test "should show admin_device_code" do
    get :show, id: @admin_device_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_device_code
    assert_response :success
  end

  test "should update admin_device_code" do
    patch :update, id: @admin_device_code, admin_device_code: {  }
    assert_redirected_to admin_device_code_path(assigns(:admin_device_code))
  end

  test "should destroy admin_device_code" do
    assert_difference('Admin::DeviceCode.count', -1) do
      delete :destroy, id: @admin_device_code
    end

    assert_redirected_to admin_device_codes_path
  end
end
