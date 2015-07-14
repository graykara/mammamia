require 'test_helper'

class Admin::ContractsControllerTest < ActionController::TestCase
  setup do
    @admin_contract = admin_contracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_contracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_contract" do
    assert_difference('Admin::Contract.count') do
      post :create, admin_contract: {  }
    end

    assert_redirected_to admin_contract_path(assigns(:admin_contract))
  end

  test "should show admin_contract" do
    get :show, id: @admin_contract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_contract
    assert_response :success
  end

  test "should update admin_contract" do
    patch :update, id: @admin_contract, admin_contract: {  }
    assert_redirected_to admin_contract_path(assigns(:admin_contract))
  end

  test "should destroy admin_contract" do
    assert_difference('Admin::Contract.count', -1) do
      delete :destroy, id: @admin_contract
    end

    assert_redirected_to admin_contracts_path
  end
end
