require 'test_helper'

class SalidasControllerTest < ActionController::TestCase
  setup do
    @salida = salidas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salida" do
    assert_difference('Salida.count') do
      post :create, salida: { cantidad: @salida.cantidad, producto_id: @salida.producto_id, user_id: @salida.user_id }
    end

    assert_redirected_to salida_path(assigns(:salida))
  end

  test "should show salida" do
    get :show, id: @salida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salida
    assert_response :success
  end

  test "should update salida" do
    patch :update, id: @salida, salida: { cantidad: @salida.cantidad, producto_id: @salida.producto_id, user_id: @salida.user_id }
    assert_redirected_to salida_path(assigns(:salida))
  end

  test "should destroy salida" do
    assert_difference('Salida.count', -1) do
      delete :destroy, id: @salida
    end

    assert_redirected_to salidas_path
  end
end
