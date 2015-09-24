require 'test_helper'

class Admin::DeviceWaresControllerTest < ActionController::TestCase
  setup do
    @admin_device_ware = admin_device_wares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_device_wares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_device_ware" do
    assert_difference('Admin::DeviceWare.count') do
      post :create, admin_device_ware: {  }
    end

    assert_redirected_to admin_device_ware_path(assigns(:admin_device_ware))
  end

  test "should show admin_device_ware" do
    get :show, id: @admin_device_ware
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_device_ware
    assert_response :success
  end

  test "should update admin_device_ware" do
    patch :update, id: @admin_device_ware, admin_device_ware: {  }
    assert_redirected_to admin_device_ware_path(assigns(:admin_device_ware))
  end

  test "should destroy admin_device_ware" do
    assert_difference('Admin::DeviceWare.count', -1) do
      delete :destroy, id: @admin_device_ware
    end

    assert_redirected_to admin_device_wares_path
  end
end
