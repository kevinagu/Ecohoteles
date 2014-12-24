class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    if params[:query]
      @productos = Producto.search(params[:query]).order("nombre ASC")
    else
      @productos = Producto.where(:seccion_id => 1)
    end
    
    @agotados = Producto.where('cantidad < stock')
    respond_with(@productos, @agotados)
  end

  def show
    respond_with(@producto)
  end

  def new
    @producto = Producto.new
    respond_with(@producto)
  end

  def edit
  end

  def create
    @producto = Producto.new(producto_params)
    @producto.cantidad=0
    @producto.save
    respond_with(@producto)
  end

  def update
    @producto.update(producto_params)
    respond_with(@producto)
  end

  def destroy
    @producto.destroy
    respond_with(@producto)
  end

  private
    def set_producto
      @producto = Producto.find(params[:id])
    end

    def producto_params
      params.require(:producto).permit(:nombre, :marca, :umedida_id, :pcosto, :pventa, :cantidad, :stock, :seccion_id, :foto)
    end
end
