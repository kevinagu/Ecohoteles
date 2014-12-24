class IngresosController < ApplicationController
  before_action :set_ingreso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @ingresos = Ingreso.all
    respond_with(@ingresos)
  end

  def show
    respond_with(@ingreso)
  end

  def new
    @ingreso = Ingreso.new
    respond_with(@ingreso)
  end

  def edit
  end

  def create
    params[:ingreso][:user_id]=current_user.id
    @ingreso = Ingreso.new(ingreso_params)
    
    @producto = Producto.find(params[:ingreso][:producto_id])
    cantidad = params[:ingreso][:cantidad]
    @producto.cantidad = @producto.cantidad.to_f + cantidad.to_f
    @producto.save
    @ingreso.save
    respond_with(@ingreso)
  end

  def update
    diferencia = @ingreso.cantidad.to_f - params[:ingreso][:cantidad].to_f  
    @producto = Producto.find(params[:ingreso][:producto_id])
    @producto.cantidad = @producto.cantidad - diferencia.to_f
    @producto.save
    @ingreso.update(ingreso_params)
    respond_with(@ingreso)
  end

  def destroy
    idp = @ingreso.producto_id
    @producto = Producto.find(idp)
    @producto.cantidad = @producto.cantidad.to_f - @ingreso.cantidad.to_f
    @producto.save
    @ingreso.destroy
    respond_with(@ingreso)
  end

  private
    def set_ingreso
      @ingreso = Ingreso.find(params[:id])
    end

    def ingreso_params
      user_id=
      params.require(:ingreso).permit(:producto_id, :user_id, :cantidad)

    end
end
