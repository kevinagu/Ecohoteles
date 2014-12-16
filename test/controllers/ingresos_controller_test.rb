require 'test_helper'

class IngresosControllerTest < ActionController::TestCase
  setup do
    @ingreso = ingresos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingresos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingreso" do
    assert_difference('Ingreso.count') do
      post :create, ingreso: { cantidad: @ingreso.cantidad, producto_id: @ingreso.producto_id, user_id: @ingreso.user_id }
    end

    assert_redirected_to ingreso_path(assigns(:ingreso))
  end

  test "should show ingreso" do
    get :show, id: @ingreso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingreso
    assert_response :success
  end

  test "should update ingreso" do
    patch :update, id: @ingreso, ingreso: { cantidad: @ingreso.cantidad, producto_id: @ingreso.producto_id, user_id: @ingreso.user_id }
    assert_redirected_to ingreso_path(assigns(:ingreso))
  end

  test "should destroy ingreso" do
    assert_difference('Ingreso.count', -1) do
      delete :destroy, id: @ingreso
    end

    assert_redirected_to ingresos_path
  end
end
