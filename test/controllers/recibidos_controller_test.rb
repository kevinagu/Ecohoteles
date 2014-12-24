require 'test_helper'

class RecibidosControllerTest < ActionController::TestCase
  setup do
    @recibido = recibidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recibidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recibido" do
    assert_difference('Recibido.count') do
      post :create, recibido: { cantidad: @recibido.cantidad, manchada: @recibido.manchada, procedencia: @recibido.procedencia, ropa_id: @recibido.ropa_id, rotas: @recibido.rotas, user_id: @recibido.user_id }
    end

    assert_redirected_to recibido_path(assigns(:recibido))
  end

  test "should show recibido" do
    get :show, id: @recibido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recibido
    assert_response :success
  end

  test "should update recibido" do
    patch :update, id: @recibido, recibido: { cantidad: @recibido.cantidad, manchada: @recibido.manchada, procedencia: @recibido.procedencia, ropa_id: @recibido.ropa_id, rotas: @recibido.rotas, user_id: @recibido.user_id }
    assert_redirected_to recibido_path(assigns(:recibido))
  end

  test "should destroy recibido" do
    assert_difference('Recibido.count', -1) do
      delete :destroy, id: @recibido
    end

    assert_redirected_to recibidos_path
  end
end
