class SalidasController < ApplicationController
  before_action :set_salida, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @salidas = Salida.all
    respond_with(@salidas)
  end

  def show
    respond_with(@salida)
  end

  def new
    @salida = Salida.new
    respond_with(@salida)
  end

  def edit
  end

  def create
    @salida = Salida.new(salida_params)
    @producto = Producto.find(params[:salida][:producto_id])
    cantidad = params[:salida][:cantidad]
    @producto.cantidad = @producto.cantidad.to_f - cantidad.to_f
    @producto.save
    @salida.save
    respond_with(@salida)
  end

  def update
    diferencia = @salida.cantidad.to_f - params[:salida][:cantidad].to_f  
    @producto = Producto.find(params[:salida][:producto_id])
    @producto.cantidad = @producto.cantidad+ diferencia.to_f
    @producto.save
    @salida.update(salida_params)
    

    respond_with(@salida)
  end

  def destroy
    idp = @salida.producto_id
    @producto = Producto.find(idp)
    @producto.cantidad = @producto.cantidad.to_f + @salida.cantidad.to_f
    @producto.save
    @salida.destroy
    respond_with(@salida)
  end

  private
    def set_salida
      @salida = Salida.find(params[:id])
    end

    def salida_params
      params.require(:salida).permit(:producto_id, :user_id, :cantidad)
    end
end
